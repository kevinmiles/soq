#ifndef RATIONAL_H_INCLUDED
#define RATIONAL_H_INCLUDED

#include <stddef.h>     // size_t

typedef struct RationalInt
{
    int     numerator;
    int     denominator;
} RationalInt;

extern RationalInt ri_new(int numerator, int denominator);
extern RationalInt ri_add(RationalInt lhs, RationalInt rhs);
extern RationalInt ri_sub(RationalInt lhs, RationalInt rhs);
extern RationalInt ri_mul(RationalInt lhs, RationalInt rhs);
extern RationalInt ri_div(RationalInt lhs, RationalInt rhs);
extern char *ri_fmt(RationalInt val, char *buffer, size_t buflen);
extern int ri_cmp(RationalInt lhs, RationalInt rhs);

extern char *ri_fmtproper(RationalInt val, char *buffer, size_t buflen);
extern RationalInt ri_integer(RationalInt val);
extern RationalInt ri_fraction(RationalInt val);

#endif /* RATIONAL_H_INCLUDED */

/*
** Storage rules:
** 1. Denominator is never zero.
** 2. Denominator stores the sign and is not INT_MIN (2's complement assumed).
** 3. Numerator is never negative.
** 4. gcd(numerator, denominator) == 1 unless numerator == 0.
*/

#include "gcd.h"        // add gcd_ll?
#include <assert.h>
#include <limits.h>
#include <stdio.h>

static inline int iabs(int x) { return (x < 0) ? -x : x; }
static inline int signum(int x) { return (x > 0) ? +1 : (x < 0) ? -1 : 0; }

static void ri_chk(RationalInt val)
{
    assert(val.denominator != 0 && val.denominator != INT_MIN);
    assert(val.numerator >= 0);
    assert(val.numerator == 0 || gcd(iabs(val.numerator), iabs(val.denominator)) == 1);
}

static long long gcd_ll(long long x, long long y)
{
    long long r;

    if (x == 0 || y == 0)
        return(0);

    while ((r = x % y) != 0)
    {
        x = y;
        y = r;
    }
    return(y);
}

RationalInt ri_new(int numerator, int denominator)
{
    assert(denominator != 0);
    RationalInt ri;
    if (numerator == 0)
    {
        ri.numerator = 0;
        ri.denominator = 1;
    }
    else
    {
        int sign = 1 - 2 * ((numerator < 0 && denominator > 0) || (numerator > 0 && denominator < 0));
        assert(sign == +1 || sign == -1);
        int dv = gcd(iabs(numerator), iabs(denominator));
        assert(dv != 0);
        ri.numerator = iabs(numerator) / dv;
        ri.denominator = sign * iabs(denominator) / dv;
    }
    return ri;
}

RationalInt ri_add(RationalInt lhs, RationalInt rhs)
{
    long long rn = lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator;
    if (rn == 0)
        return ri_new(0, 1);
    long long rd = lhs.denominator * rhs.denominator;
    long long dv = gcd_ll(rn, rd);
    long long nr = rn / dv;
    long long dr = rd / dv;
    assert(nr <= INT_MAX && nr >= INT_MIN);
    assert(dr <= INT_MAX && dr >= INT_MIN);
    return ri_new(nr, dr);
}

RationalInt ri_sub(RationalInt lhs, RationalInt rhs)
{
    long long rn = lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator;
    if (rn == 0)
        return ri_new(0, 1);
    long long rd = lhs.denominator * rhs.denominator;
    long long dv = gcd_ll(rn, rd);
    long long nr = rn / dv;
    long long dr = rd / dv;
    assert(nr <= INT_MAX && nr >= INT_MIN);
    assert(dr <= INT_MAX && dr >= INT_MIN);
    return ri_new(nr, dr);
}

RationalInt ri_mul(RationalInt lhs, RationalInt rhs)
{
    long long rn = lhs.numerator * rhs.numerator;
    if (rn == 0)
        return ri_new(0, 1);
    long long rd = lhs.denominator * rhs.denominator;
    long long dv = gcd_ll(rn, rd);
    long long nr = rn / dv;
    long long dr = rd / dv;
    assert(nr <= INT_MAX && nr >= INT_MIN);
    assert(dr <= INT_MAX && dr >= INT_MIN);
    return ri_new(nr, dr);
}

RationalInt ri_div(RationalInt lhs, RationalInt rhs)
{
    assert(rhs.numerator != 0);
    if (lhs.numerator == 0)
        return ri_new(0, 1);
    long long rn = lhs.numerator * rhs.denominator;
    long long rd = lhs.denominator * rhs.numerator;
    long long dv = gcd_ll(rn, rd);
    long long nr = rn / dv;
    long long dr = rd / dv;
    assert(nr <= INT_MAX && nr >= INT_MIN);
    assert(dr <= INT_MAX && dr >= INT_MIN);
    return ri_new(nr, dr);
}

char *ri_fmt(RationalInt val, char *buffer, size_t buflen)
{
    assert(buflen > 0 && buffer != 0);
    ri_chk(val);
    if (buflen > 0 && buffer != 0)
    {
        char sign = (val.denominator < 0) ? '-' : '+';
        int len;
        if (iabs(val.denominator) == 1)
            len = snprintf(buffer, buflen, "[%c%d]", sign, val.numerator);
        else
            len = snprintf(buffer, buflen, "[%c%d/%d]",
                           sign, iabs(val.numerator), iabs(val.denominator));
        if (len <= 0 || (size_t)len >= buflen)
            *buffer = '\0';
    }
    return buffer;
}

int ri_cmp(RationalInt lhs, RationalInt rhs)
{
    if (lhs.denominator == rhs.denominator &&
        lhs.numerator == rhs.numerator)
        return 0;
    if (signum(lhs.denominator) != signum(rhs.denominator))
    {
        /* Different signs - but one could be zero */
        if (signum(lhs.denominator) < signum(rhs.denominator))
            return -1;
        else
            return +1;
    }
    long long v1 = lhs.numerator * iabs(rhs.denominator);
    long long v2 = rhs.numerator * iabs(lhs.denominator);
    assert(v1 != v2);
    if (v1 < v2)
        return -1;
    else
        return +1;
}

char *ri_fmtproper(RationalInt val, char *buffer, size_t buflen)
{
    RationalInt in = ri_integer(val);
    RationalInt fr = ri_fraction(val);
    char sign = (val.denominator < 0) ? '-' : '+';
    int len;
    assert(in.denominator == +1 || in.denominator == -1);
    if (in.numerator != 0 && fr.numerator != 0)
    {
        len = snprintf(buffer, buflen, "[%c%d %d/%d]", sign,
                       iabs(in.numerator), iabs(fr.numerator), iabs(fr.denominator));
    }
    else if (in.numerator != 0)
    {
        len = snprintf(buffer, buflen, "[%c%d]", sign, iabs(in.numerator));
    }
    else if (fr.numerator != 0)
    {
        len = snprintf(buffer, buflen, "[%c%d/%d]",
                       sign, iabs(val.numerator), iabs(val.denominator));
    }
    else
    {
        len = snprintf(buffer, buflen, "[0]");
    }
    if (len <= 0 || (size_t)len >= buflen)
        *buffer = '\0';
    return buffer;
}

RationalInt ri_integer(RationalInt val)
{
    RationalInt ri = ri_new(val.numerator / val.denominator, 1);
    return ri;
}

RationalInt ri_fraction(RationalInt val)
{
    RationalInt ri = ri_new(val.numerator % val.denominator, val.denominator);
    return ri;
}

#define TEST    // Temporary
#if defined(TEST)

#include "phasedtest.h"

/* -- PHASE 1 TESTING -- */

/* -- ri_new -- */
typedef struct p1_test_case
{
    int i_num;
    int i_den;
    RationalInt res;
} p1_test_case;

static const p1_test_case p1_tests[] =
{
    { .i_num =  1, .i_den =  1, .res = {  1,   1 } },
    { .i_num =  0, .i_den =  1, .res = {  0,   1 } },
    { .i_num =  2, .i_den =  2, .res = {  1,   1 } },
    { .i_num =  1, .i_den =  2, .res = {  1,   2 } },
    { .i_num = 15, .i_den =  3, .res = {  5,   1 } },
    { .i_num = 28, .i_den =  6, .res = { 14,   3 } },
    { .i_num =  6, .i_den = 28, .res = {  3,  14 } },
    { .i_num = +6, .i_den = +8, .res = {  3,  +4 } },
    { .i_num = +6, .i_den = -8, .res = {  3,  -4 } },
    { .i_num = -6, .i_den = +8, .res = {  3,  -4 } },
    { .i_num = -6, .i_den = -8, .res = {  3,  +4 } },
};

static void p1_tester(const void *data)
{
    const p1_test_case *test = (const p1_test_case *)data;
    char buffer1[32];
    char buffer2[32];

    RationalInt ri = ri_new(test->i_num, test->i_den);

    if (ri.denominator != test->res.denominator ||
        ri.numerator != test->res.numerator)
        pt_fail("ri_new(%d, %d) - unexpected result %s (instead of %s)\n",
                test->i_num, test->i_den, ri_fmt(ri, buffer1, sizeof(buffer1)),
                ri_fmt(test->res, buffer2, sizeof(buffer2)));
    else
        pt_pass("ri_new(%d, %d) - %s\n", test->i_num, test->i_den,
                ri_fmt(test->res, buffer2, sizeof(buffer2)));
}

/* -- PHASE 2 TESTING -- */

/* -- ri_cmp -- */
typedef struct p2_test_case
{
    RationalInt lhs;
    RationalInt rhs;
    int         res;
} p2_test_case;

static const p2_test_case p2_tests[] =
{
    { {  0,  +1 }, {  0,  +1 },  0 },
    { {  1,  +1 }, {  0,  +1 }, +1 },
    { {  0,  +1 }, {  1,  +1 }, -1 },
    { {  0,  +1 }, {  1,  -1 }, +1 },
    { {  1,  -1 }, {  1,  +1 }, -1 },
    { {  1,  +1 }, {  1,  -1 }, +1 },
    { {  9, +10 }, {  1,  +1 }, -1 },
    { { 11, +10 }, {  1,  +1 }, +1 },
    { {  9, +10 }, { 19, +20 }, -1 },
    { {  9, +10 }, { 17, +20 }, +1 },
};

static void p2_tester(const void *data)
{
    const p2_test_case *test = (const p2_test_case *)data;
    char buffer1[32];
    char buffer2[32];

    int rc = ri_cmp(test->lhs, test->rhs);
    if (rc != test->res)
        pt_fail("unexpected result (%s <=> %s) gave %+d instead of %+d\n",
                 ri_fmt(test->lhs, buffer1, sizeof(buffer1)),
                 ri_fmt(test->rhs, buffer2, sizeof(buffer2)),
                 rc, test->res);
    else
        pt_pass("(%s <=> %s) = %+d\n",
                 ri_fmt(test->lhs, buffer1, sizeof(buffer1)),
                 ri_fmt(test->rhs, buffer2, sizeof(buffer2)),
                 test->res);
}

/* -- PHASE 3 TESTING -- */

/* -- Rational Binary Operators -- */
typedef struct BinaryOp
{
    RationalInt (*op_func)(RationalInt lhs, RationalInt rhs);
    char         *op_name;
} BinaryOp;

enum { OP_ADD, OP_SUB, OP_MUL, OP_DIV };  // OP_MOD, OP_POW, ...

static const BinaryOp ri_ops[] =
{
    [OP_ADD] = { ri_add, "+" },
    [OP_SUB] = { ri_sub, "-" },
    [OP_MUL] = { ri_mul, "*" },
    [OP_DIV] = { ri_div, "/" },
};

typedef struct p3_test_case
{
    const BinaryOp *op;
    RationalInt lhs;
    RationalInt rhs;
    RationalInt res;
} p3_test_case;

static const p3_test_case p3_tests[] =
{

    { &ri_ops[OP_ADD], {  0,  1 }, {  0,  1 }, {    0,   1 } },
    { &ri_ops[OP_ADD], {  1,  1 }, {  0,  1 }, {    1,   1 } },
    { &ri_ops[OP_ADD], {  1,  1 }, {  1,  1 }, {    2,   1 } },
    { &ri_ops[OP_ADD], {  1,  1 }, {  1, -1 }, {    0,   1 } },
    { &ri_ops[OP_ADD], { 23, 31 }, { 37, 19 }, { 1584, 589 } },
    { &ri_ops[OP_ADD], { 14, -9 }, { 12, -7 }, {  206, -63 } },
    { &ri_ops[OP_ADD], { 14, -9 }, { 12, +7 }, {   10, +63 } },
    { &ri_ops[OP_ADD], { 14, +9 }, { 12, -7 }, {   10, -63 } },
    { &ri_ops[OP_ADD], { 14, +9 }, { 12, +7 }, {  206, +63 } },

    { &ri_ops[OP_SUB], {  0,  1 }, {  0,  1 }, {    0,    1 } },
    { &ri_ops[OP_SUB], {  1,  1 }, {  0,  1 }, {    1,    1 } },
    { &ri_ops[OP_SUB], {  1,  1 }, {  1,  1 }, {    0,    1 } },
    { &ri_ops[OP_SUB], {  1, -1 }, {  1,  1 }, {    2,   -1 } },
    { &ri_ops[OP_SUB], {  1, -1 }, {  2, -1 }, {    1,    1 } },
    { &ri_ops[OP_SUB], {  1,  1 }, {  1, -1 }, {    2,    1 } },
    { &ri_ops[OP_SUB], { 23, 31 }, { 37, 19 }, {  710, -589 } },
    { &ri_ops[OP_SUB], { 14, -9 }, { 12, -7 }, {   10,  +63 } },
    { &ri_ops[OP_SUB], { 14, -9 }, { 12, +7 }, {  206,  -63 } },
    { &ri_ops[OP_SUB], { 14, +9 }, { 12, -7 }, {  206,  +63 } },
    { &ri_ops[OP_SUB], { 14, +9 }, { 12, +7 }, {   10,  -63 } },

    { &ri_ops[OP_MUL], {  0,  1 }, {  0,  1 }, {    0,    1 } },
    { &ri_ops[OP_MUL], {  1,  1 }, {  0,  1 }, {    0,    1 } },
    { &ri_ops[OP_MUL], {  1,  1 }, {  1,  1 }, {    1,    1 } },
    { &ri_ops[OP_MUL], {  1, -1 }, {  1,  1 }, {    1,   -1 } },
    { &ri_ops[OP_MUL], {  1, -1 }, {  2, -1 }, {    2,    1 } },
    { &ri_ops[OP_MUL], {  1,  1 }, {  1, -1 }, {    1,   -1 } },
    { &ri_ops[OP_MUL], { 23, 31 }, { 37, 19 }, {  851,  589 } },
    { &ri_ops[OP_MUL], { 14, -9 }, { 12, -7 }, {    8,   +3 } },
    { &ri_ops[OP_MUL], { 14, -9 }, { 12, +7 }, {    8,   -3 } },
    { &ri_ops[OP_MUL], { 14, +9 }, { 12, -7 }, {    8,   -3 } },
    { &ri_ops[OP_MUL], { 14, +9 }, { 12, +7 }, {    8,   +3 } },

    { &ri_ops[OP_DIV], {  0,  1 }, {  1,  1 }, {    0,    1 } },
    { &ri_ops[OP_DIV], {  1,  1 }, {  1,  1 }, {    1,    1 } },
    { &ri_ops[OP_DIV], {  1, -1 }, {  1,  1 }, {    1,   -1 } },
    { &ri_ops[OP_DIV], {  1, -1 }, {  2, -1 }, {    1,    2 } },
    { &ri_ops[OP_DIV], {  1,  1 }, {  1, -1 }, {    1,   -1 } },
    { &ri_ops[OP_DIV], { 23, 31 }, { 37, 19 }, {  437, 1147 } },
    { &ri_ops[OP_DIV], { 14, -9 }, { 12, -7 }, {   49,  +54 } },
    { &ri_ops[OP_DIV], { 14, -9 }, { 12, +7 }, {   49,  -54 } },
    { &ri_ops[OP_DIV], { 14, +9 }, { 12, -7 }, {   49,  -54 } },
    { &ri_ops[OP_DIV], { 14, +9 }, { 12, +7 }, {   49,  +54 } },

};

static void p3_tester(const void *data)
{
    const p3_test_case *test = (const p3_test_case *)data;
    char buffer1[32];
    char buffer2[32];
    char buffer3[32];
    char buffer4[32];

    RationalInt res = (*test->op->op_func)(test->lhs, test->rhs);
    int rc = ri_cmp(test->res, res);
    if (rc != 0)
        pt_fail("unexpected result for %s %s %s (actual %s vs wanted %s: %d)\n",
                ri_fmt(test->lhs, buffer1, sizeof(buffer1)),
                test->op->op_name,
                ri_fmt(test->rhs, buffer2, sizeof(buffer2)),
                ri_fmt(res,       buffer3, sizeof(buffer3)),
                ri_fmt(test->res, buffer4, sizeof(buffer4)),
                rc);
    else
        pt_pass("%s %s %s = %s\n",
                ri_fmt(test->lhs, buffer1, sizeof(buffer1)),
                test->op->op_name,
                ri_fmt(test->rhs, buffer2, sizeof(buffer2)),
                ri_fmt(test->res, buffer3, sizeof(buffer3)));
}

/* -- PHASE 4 TESTING -- */

/* -- Fraction and Integer -- */
typedef struct p4_test_case
{
    RationalInt input;
    RationalInt o_int;
    RationalInt o_frac;
} p4_test_case;

static const p4_test_case p4_tests[] =
{
    { {  0,   1 }, { 0,  1 }, {  0,   1 } },
    { {  1,   1 }, { 1,  1 }, {  0,   1 } },
    { {  1,   2 }, { 0,  1 }, {  1,   2 } },
    { {  3,   2 }, { 1,  1 }, {  1,   2 } },
    { { 23, +12 }, { 1, +1 }, { 11, +12 } },
    { { 23, -12 }, { 1, -1 }, { 11, -12 } },
    { { 12, +23 }, { 0, +1 }, { 12, +23 } },
    { { 12, -23 }, { 0, +1 }, { 12, -23 } },
};

static void p4_tester(const void *data)
{
    const p4_test_case *test = (const p4_test_case *)data;
    RationalInt ri = ri_integer(test->input);
    RationalInt rf = ri_fraction(test->input);
    char buffer0[32];
    char buffer1[32];
    char buffer2[32];
    char buffer3[32];
    char buffer4[32];
    char buffer5[32];

    int rc1 = ri_cmp(ri, test->o_int);
    int rc2 = ri_cmp(rf, test->o_frac);
    if (rc1 != 0 || rc2 != 0)
        pt_fail("%s: unexpected result %s (%d: actual %s vs wanted %s)"
                "(%d: actual %s vs wanted %s)\n",
                ri_fmt(test->input,  buffer0, sizeof(buffer0)),
                ri_fmtproper(test->input,  buffer1, sizeof(buffer1)),
                rc1,
                ri_fmtproper(ri,           buffer2, sizeof(buffer2)),
                ri_fmtproper(test->o_int,  buffer3, sizeof(buffer3)),
                rc2,
                ri_fmtproper(rf,           buffer4, sizeof(buffer4)),
                ri_fmtproper(test->o_frac, buffer5, sizeof(buffer5)));
    else
        pt_pass("%s: %s becomes %s and %s\n",
                ri_fmt(test->input,  buffer0, sizeof(buffer0)),
                ri_fmtproper(test->input,  buffer1, sizeof(buffer1)),
                ri_fmtproper(ri,           buffer2, sizeof(buffer2)),
                ri_fmtproper(rf,           buffer4, sizeof(buffer4)));
}

/* -- Phased Test Infrastructure -- */

static pt_auto_phase phases[] =
{
    { p1_tester, PT_ARRAYINFO(p1_tests), 0, "ri_new" },
    { p2_tester, PT_ARRAYINFO(p2_tests), 0, "ri_cmp" },
    { p3_tester, PT_ARRAYINFO(p3_tests), 0, "Rational Binary Operators" },
    { p4_tester, PT_ARRAYINFO(p4_tests), 0, "Fraction and Integer" },
};

int main(int argc, char **argv)
{
    return(pt_auto_harness(argc, argv, phases, DIM(phases)));
}

#endif /* TEST */