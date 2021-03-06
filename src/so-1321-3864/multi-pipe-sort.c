/* SO 1321-3864 Multiprocessing and pipes in C */

#include "posixver.h"
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

typedef struct Child
{
    FILE *fp_to;
    FILE *fp_from;
    pid_t pid;
} Child;

enum { P_READ, P_WRITE };   /* Read, write descriptor of a pipe */
enum { MAX_LINE = 4096 };

static void be_childish(void);
static void distribute(size_t nkids, Child *kids);
static void err_exit(const char *fmt, ...);
static void merge(size_t nkids, Child *kids);
static void wait_for_kids(size_t nkids, Child *kids);

static int make_kid(Child *kid)
{
    int pipe1[2];   /* From parent to child */
    int pipe2[2];   /* From child to parent */
    if (pipe(pipe1) != 0)
        return -1;
    if (pipe(pipe2) != 0)
    {
        close(pipe1[P_READ]);
        close(pipe1[P_WRITE]);
        return -1;
    }
    if ((kid->pid = fork()) < 0)
    {
        close(pipe1[P_READ]);
        close(pipe1[P_WRITE]);
        close(pipe2[P_READ]);
        close(pipe2[P_WRITE]);
        return -1;
    }
    else if (kid->pid == 0)
    {
        dup2(pipe1[P_READ], STDIN_FILENO);
        dup2(pipe2[P_WRITE], STDOUT_FILENO);
        close(pipe1[P_READ]);
        close(pipe1[P_WRITE]);
        close(pipe2[P_READ]);
        close(pipe2[P_WRITE]);
        /* Reads standard input from parent; writes standard output to parent */
        be_childish();
        exit(0);
    }
    else
    {
        kid->fp_to   = fdopen(pipe1[P_WRITE], "w");
        kid->fp_from = fdopen(pipe2[P_READ], "r");
        close(pipe1[P_READ]);
        close(pipe2[P_WRITE]);
        return 0;
    }
}

int main(void)
{
    enum { NUM_KIDS = 5 };
    Child kids[NUM_KIDS];
    struct sigaction act;

    sigfillset(&act.sa_mask);
    act.sa_flags   = 0;
    act.sa_handler = SIG_DFL;
    sigaction(SIGCHLD, &act, 0);

    for (int i = 0; i < NUM_KIDS; i++)
    {
        if (make_kid(&kids[i]) != 0)
            err_exit("Fault starting child %d\n", i);
    }

    distribute(NUM_KIDS, kids);
    merge(NUM_KIDS, kids);

    wait_for_kids(NUM_KIDS, kids);
    return(0);
}

static void err_exit(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    vfprintf(stderr, fmt, args);
    va_end(args);
    exit(1);
}

static int qs_compare(const void *v1, const void *v2)
{
    const char *s1 = *(char **)v1;
    const char *s2 = *(char **)v2;
    return(strcmp(s1, s2));
}

static char *estrdup(const char *str)
{
    size_t len = strlen(str) + 1;
    char *out = malloc(len);
    if (out == 0)
        err_exit("Out of memory!\n");
    memmove(out, str, len);
    return(out);
}

static void be_childish(void)
{
    char **lines = 0;
    size_t num_lines = 0;
    size_t max_lines = 0;
    char input[MAX_LINE];

    while (fgets(input, sizeof(input), stdin) != 0)
    {
        if (num_lines >= max_lines)
        {
            size_t n = (2 * max_lines + 2);
            void *space = realloc(lines, n * sizeof(char *));
            if (space == 0)
                err_exit("Out of memory!\n");
            lines = space;
            max_lines = n;
        }
        lines[num_lines++] = estrdup(input);
    }

    qsort(lines, num_lines, sizeof(char *), qs_compare);

    for (size_t i = 0; i < num_lines; i++)
    {
        if (fputs(lines[i], stdout) == EOF)
            err_exit("Short write to parent from %d\n", (int)getpid());
    }

    exit(0);
}

static void distribute(size_t nkids, Child *kids)
{
    char   input[MAX_LINE];
    size_t n = 0;

    while (fgets(input, sizeof(input), stdin) != 0)
    {
        if (fputs(input, kids[n].fp_to) == EOF)
            err_exit("Short write to child %d\n", (int)kids[n].pid);
        if (++n >= nkids)
            n = 0;
    }

    /* Close pipes to children - let's them get on with sorting */
    for (size_t i = 0; i < nkids; i++)
    {
        fclose(kids[i].fp_to);
        kids[i].fp_to = 0;
    }
}

static void read_line(Child *kid, char *buffer, size_t maxlen, int *length)
{
    if (fgets(buffer, maxlen, kid->fp_from) != 0)
    {
        *length = strlen(buffer);
        buffer[*length] = '\0';
    }
    else
    {
        buffer[0] = '\0';
        *length = -1;
        fclose(kid->fp_from);
        kid->fp_from = 0;
    }
}

static int not_all_done(size_t nkids, int *lengths)
{
    for (size_t i = 0; i < nkids; i++)
    {
        if (lengths[i] > 0)
            return 1;
    }
    return 0;
}

static void min_line(size_t nkids, int *len, char **lines, size_t maxlen, Child *kids, char *output)
{
    size_t  min_kid = 0;
    char   *min_str = 0;
    for (size_t i = 0; i < nkids; i++)
    {
        if (len[i] <= 0)
            continue;
        if (min_str == 0 || strcmp(min_str, lines[i]) > 0)
        {
            min_str = lines[i];
            min_kid = i;
        }
    }
    strcpy(output, min_str);
    read_line(&kids[min_kid], lines[min_kid], maxlen, &len[min_kid]);
}

static void merge(size_t nkids, Child *kids)
{
    char line_data[nkids][MAX_LINE];
    char *lines[nkids];
    int  len[nkids];
    char output[MAX_LINE];

    for (size_t i = 0; i < nkids; i++)
        lines[i] = line_data[i];

    /* Preload first line from each kid */
    for (size_t i = 0; i < nkids; i++)
        read_line(&kids[i], lines[i], MAX_LINE, &len[i]);

    while (not_all_done(nkids, len))
    {
        min_line(nkids, len, lines, MAX_LINE, kids, output);
        fputs(output, stdout);
    }
}

static void wait_for_kids(size_t nkids, Child *kids)
{
    int pid;
    int status;

    while ((pid = waitpid(-1, &status, 0)) != -1)
    {
        for (size_t i = 0; i < nkids; i++)
        {
            if (pid == kids[i].pid)
                kids[i].pid = -1;
        }
    }

    /* This check loop is not really necessary */
    for (size_t i = 0; i < nkids; i++)
    {
        if (kids[i].pid != -1)
            err_exit("Child %d died without being tracked\n", (int)kids[i].pid);
    }
}
