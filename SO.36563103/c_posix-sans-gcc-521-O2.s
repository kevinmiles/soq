	.text
Ltext0:
	.cstring
LC0:
	.ascii "Received SIGINT\12\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB1:
	.text
LHOTB1:
	.align 4,0x90
	.section __TEXT,__text_cold,regular,pure_instructions
Ltext_cold0:
	.text
_sighandler:
LFB21:
LM1:
LVL0:
LM2:
	movl	$16, %edx
LVL1:
	movl	$2, %edi
LVL2:
	leaq	LC0(%rip), %rsi
LVL3:
	jmp	_write
LVL4:
LFE21:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE1:
	.text
LHOTE1:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB2:
	.text
LHOTB2:
	.align 4,0x90
_StartsWith:
LFB15:
LM3:
LVL5:
	pushq	%rbp
LCFI0:
	movq	%rdi, %rbp
LM4:
	movq	%rsi, %rdi
LVL6:
LM5:
	pushq	%rbx
LCFI1:
	movq	%rsi, %rbx
	subq	$8, %rsp
LCFI2:
LM6:
	call	_strlen
LVL7:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	movq	%rax, %rdx
	call	_strncmp
LVL8:
	testl	%eax, %eax
	sete	%al
LM7:
	addq	$8, %rsp
LCFI3:
	movzbl	%al, %eax
	popq	%rbx
LCFI4:
LVL9:
	popq	%rbp
LCFI5:
LVL10:
	ret
LFE15:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE2:
	.text
LHOTE2:
	.cstring
LC3:
	.ascii "(%d: %s)\12\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB4:
LHOTB4:
_err_syserr:
LFB14:
LM8:
LVL11:
	pushq	%r12
LCFI6:
	movq	%rdi, %r12
	pushq	%rbp
LCFI7:
	pushq	%rbx
LCFI8:
	subq	$208, %rsp
LCFI9:
	testb	%al, %al
	movq	%rsi, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	je	L7
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
L7:
LM9:
	call	___error
LVL12:
LM10:
	movq	___stderrp@GOTPCREL(%rip), %rbp
	leaq	8(%rsp), %rdx
	movq	%r12, %rsi
LM11:
	movl	(%rax), %ebx
LVL13:
LM12:
	leaq	240(%rsp), %rax
	movl	$8, 8(%rsp)
	movq	%rax, 16(%rsp)
	leaq	32(%rsp), %rax
	movl	$48, 12(%rsp)
LM13:
	movq	0(%rbp), %rdi
LM14:
	movq	%rax, 24(%rsp)
LM15:
	call	_vfprintf
LVL14:
LM16:
	testl	%ebx, %ebx
	je	L6
LM17:
	movl	%ebx, %edi
	call	_strerror
LVL15:
	movq	0(%rbp), %rdi
	movl	%ebx, %edx
	leaq	LC3(%rip), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	_fprintf
LVL16:
L6:
LM18:
	movl	$1, %edi
	call	_exit
LVL17:
LFE14:
LCOLDE4:
LHOTE4:
	.cstring
LC5:
	.ascii "%s:%d: \0"
LC6:
	.ascii " (%d: %s)\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB7:
	.text
LHOTB7:
	.align 4,0x90
_err_vsyswarn:
LFB11:
LM19:
LVL18:
	pushq	%r13
LCFI10:
	movq	%rsi, %r13
	pushq	%r12
LCFI11:
	movq	%rdi, %r12
	pushq	%rbp
LCFI12:
	pushq	%rbx
LCFI13:
	subq	$8, %rsp
LCFI14:
LM20:
	call	___error
LVL19:
	movl	(%rax), %ebp
LVL20:
LM21:
	call	_getpid
LVL21:
	movq	___stderrp@GOTPCREL(%rip), %rbx
	leaq	LC5(%rip), %rsi
	movq	_arg0(%rip), %rdx
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	(%rbx), %rdi
	call	_fprintf
LVL22:
LM22:
	movq	(%rbx), %rdi
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	_vfprintf
LVL23:
LM23:
	testl	%ebp, %ebp
	je	L14
LM24:
	movl	%ebp, %edi
	call	_strerror
LVL24:
	movq	(%rbx), %rdi
	movl	%ebp, %edx
	leaq	LC6(%rip), %rsi
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	_fprintf
LVL25:
L14:
LM25:
	movq	(%rbx), %rsi
LM26:
	addq	$8, %rsp
LCFI15:
LM27:
	movl	$10, %edi
LM28:
	popq	%rbx
LCFI16:
	popq	%rbp
LCFI17:
LVL26:
	popq	%r12
LCFI18:
LVL27:
	popq	%r13
LCFI19:
LVL28:
LM29:
	jmp	_putc
LVL29:
LFE11:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE7:
	.text
LHOTE7:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB8:
	.text
LHOTB8:
	.align 4,0x90
_err_sysexit:
LFB13:
LM30:
LVL30:
	subq	$216, %rsp
LCFI20:
	testb	%al, %al
	movq	%rsi, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	je	L21
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
L21:
LM31:
	leaq	224(%rsp), %rax
	movl	$8, 8(%rsp)
	movq	%rax, 16(%rsp)
LM32:
	leaq	8(%rsp), %rsi
LM33:
	leaq	32(%rsp), %rax
	movl	$48, 12(%rsp)
	movq	%rax, 24(%rsp)
LM34:
	call	_err_vsyswarn
LVL31:
LM35:
	movl	$1, %edi
	call	_exit
LVL32:
LFE13:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE8:
	.text
LHOTE8:
	.cstring
LC9:
	.ascii "ncmds >= 1\0"
LC10:
	.ascii "c_posix.c\0"
LC11:
	.ascii "Failed to create pipe\0"
LC12:
	.ascii "Failed to fork\0"
LC13:
	.ascii "Failed to exec %s\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB14:
	.text
LHOTB14:
	.align 4,0x90
_exec_nth_command:
LFB3:
LM36:
LVL33:
	pushq	%rbp
LCFI21:
	pushq	%rbx
LCFI22:
	movslq	%edi, %rbx
	subq	$24, %rsp
LCFI23:
LM37:
	testl	%ebx, %ebx
	jle	L33
LM38:
	cmpl	$1, %ebx
	movq	%rsi, %rbp
	je	L25
LBB20:
LM39:
	movq	%rsp, %rdi
LVL34:
	call	_pipe
LVL35:
	testl	%eax, %eax
	jne	L34
LM40:
	call	_fork
LVL36:
	testl	%eax, %eax
	js	L35
LM41:
	je	L36
LM42:
	movl	(%rsp), %edi
	xorl	%esi, %esi
	call	_dup2
LVL37:
LM43:
	movl	(%rsp), %edi
	call	_close
LVL38:
LM44:
	movl	4(%rsp), %edi
	call	_close
LVL39:
L25:
LBE20:
LM45:
	leaq	-8(%rbp,%rbx,8), %rbx
LVL40:
	movq	(%rbx), %rax
	movq	(%rax), %rdi
	movq	%rax, %rsi
	call	_execvp
LVL41:
LM46:
	movq	(%rbx), %rax
	leaq	LC13(%rip), %rdi
	movq	(%rax), %rsi
	xorl	%eax, %eax
	call	_err_sysexit
LVL42:
L34:
LBB23:
LM47:
	leaq	LC11(%rip), %rdi
	xorl	%eax, %eax
	call	_err_sysexit
LVL43:
L33:
LBE23:
LM48:
	leaq	LC9(%rip), %rcx
	movl	$49, %edx
	leaq	LC10(%rip), %rsi
LVL44:
	leaq	___func__.3142(%rip), %rdi
LVL45:
	call	___assert_rtn
LVL46:
L36:
LBB24:
LBB21:
LBB22:
LM49:
	movl	4(%rsp), %edi
	movl	$1, %esi
	call	_dup2
LVL47:
LM50:
	movl	(%rsp), %edi
	call	_close
LVL48:
LM51:
	movl	4(%rsp), %edi
	call	_close
LVL49:
LM52:
	leal	-1(%rbx), %edi
LVL50:
	movq	%rbp, %rsi
	call	_exec_nth_command
LVL51:
L35:
LBE22:
LBE21:
LM53:
	leaq	LC12(%rip), %rdi
	xorl	%eax, %eax
LVL52:
	call	_err_sysexit
LVL53:
LBE24:
LFE3:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE14:
	.text
LHOTE14:
	.cstring
LC15:
	.ascii "\12\12\12\12%d terminated \12\12\12\12\12\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB16:
	.text
LHOTB16:
	.align 4,0x90
_Janitor.constprop.0:
LFB26:
LM54:
	pushq	%rbx
LCFI24:
	subq	$16, %rsp
LCFI25:
	movl	$20, 12(%rsp)
LVL54:
	leaq	12(%rsp), %rbx
LVL55:
L40:
LBB25:
LBB26:
LM55:
	movl	$1, %edx
	movq	%rbx, %rsi
	movl	$-1, %edi
	call	_waitpid
LVL56:
LM56:
	testl	%eax, %eax
	jle	L37
LM57:
	cmpl	_foreground(%rip), %eax
	je	L40
LM58:
	movl	12(%rsp), %edx
	andl	$127, %edx
	cmpl	$127, %edx
	je	L40
LM59:
	leaq	LC15(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
LVL57:
	call	_printf
LVL58:
	jmp	L40
LVL59:
	.align 4,0x90
L37:
LBE26:
LBE25:
LM60:
	addq	$16, %rsp
LCFI26:
	popq	%rbx
LCFI27:
LVL60:
	ret
LFE26:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE16:
	.text
LHOTE16:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB17:
	.text
LHOTB17:
	.align 4,0x90
_err_syswarn.constprop.3:
LFB23:
LM61:
LVL61:
	subq	$216, %rsp
LCFI28:
	testb	%al, %al
	movq	%rsi, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	je	L47
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
L47:
LVL62:
LM62:
	leaq	224(%rsp), %rax
	movl	$8, 8(%rsp)
	movq	%rax, 16(%rsp)
LM63:
	leaq	8(%rsp), %rsi
LM64:
	leaq	32(%rsp), %rax
	movl	$48, 12(%rsp)
LM65:
	leaq	LC12(%rip), %rdi
LVL63:
LM66:
	movq	%rax, 24(%rsp)
LM67:
	call	_err_vsyswarn
LVL64:
LM68:
	addq	$216, %rsp
LCFI29:
	ret
LFE23:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE17:
	.text
LHOTE17:
	.cstring
LC18:
	.ascii "(null)\0"
LC19:
	.ascii "printenv\0"
LC20:
	.ascii "sort\0"
LC21:
	.ascii "less\0"
LC22:
	.ascii "PATH\0"
LC23:
	.ascii "'%s' is not set.\12\0"
LC24:
	.ascii "'%s' is set to %s.\12\0"
LC25:
	.ascii ":\0"
LC26:
	.ascii "malloc failed!\0"
LC27:
	.ascii "miniShell>> \0"
LC28:
	.ascii "\12\0"
LC29:
	.ascii "exit\0"
LC30:
	.ascii "cd\0"
	.align 3
LC31:
	.ascii "Failed changing to homedirectory\12\0"
LC32:
	.ascii " \0"
LC33:
	.ascii "Failed changing directory\12\0"
LC34:
	.ascii "unixinfo\0"
LC35:
	.ascii "PAGER\0"
LC36:
	.ascii "more\0"
LC37:
	.ascii "grep\0"
LC38:
	.ascii "-E\0"
LC39:
	.ascii "Failed creating pipe\0"
	.align 3
LC40:
	.ascii "dup2() failed on stdin for %s: \0"
	.align 3
LC41:
	.ascii "dup2() failed on stdout for %s: \0"
LC42:
	.ascii "%d: executing %s\12\0"
LC43:
	.ascii "failed to execute %s: \0"
LC44:
	.ascii "fork failed: \0"
LC45:
	.ascii "Failed creating pipe\12\0"
LC46:
	.ascii "Entering exec_arguments\0"
LC47:
	.ascii "%s: (%d)\0"
LC48:
	.ascii " {%s}\0"
LC49:
	.ascii "argv[argc] == 0\0"
LC50:
	.ascii "|\0"
	.align 3
LC51:
	.ascii "Syntax error: pipe before any command\0"
	.align 3
LC52:
	.ascii "Syntax error: two pipes with no command between\0"
	.align 3
LC53:
	.ascii "Syntax error: pipe with no command following\0"
LC54:
	.ascii "SOC\0"
LC55:
	.ascii "cmd [%d]\0"
LC56:
	.ascii "EOC\0"
LC57:
	.ascii "%d: child %d status 0x%.4X\12\0"
LC58:
	.ascii "Execution time %ld.%03ld ms\12\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB59:
	.section __TEXT,__text_startup,regular,pure_instructions
LHOTB59:
	.align 4
	.globl _main
_main:
LFB22:
LM69:
LVL65:
	pushq	%r15
LCFI30:
LM70:
	leaq	LC19(%rip), %rax
LM71:
	movl	$2, %edi
LVL66:
LM72:
	pushq	%r14
LCFI31:
	pushq	%r13
LCFI32:
	pushq	%r12
LCFI33:
	pushq	%rbp
LCFI34:
	pushq	%rbx
LCFI35:
	subq	$2376, %rsp
LCFI36:
LM73:
	movq	%rax, 112(%rsp)
LM74:
	leaq	LC20(%rip), %rax
	movq	%rax, 128(%rsp)
LM75:
	leaq	LC21(%rip), %rax
LM76:
	movq	%rsi, 8(%rsp)
LM77:
	leaq	208(%rsp), %rdx
LM78:
	movq	%rax, 144(%rsp)
LM79:
	leaq	192(%rsp), %rsi
LVL67:
LM80:
	leaq	_sighandler(%rip), %rax
LM81:
	movq	$0, 200(%rsp)
LM82:
	movq	$0, 120(%rsp)
LM83:
	movq	$0, 136(%rsp)
LM84:
	movq	$0, 152(%rsp)
LM85:
	movl	$0, 72(%rsp)
LVL68:
LM86:
	movq	%rax, 192(%rsp)
LM87:
	movl	$64, 204(%rsp)
LM88:
	call	_sigaction
LVL69:
LM89:
	leaq	LC22(%rip), %rdi
	call	_getenv
LVL70:
LM90:
	testq	%rax, %rax
LM91:
	movq	%rax, %rbx
LVL71:
LM92:
	je	L161
LM93:
	leaq	LC22(%rip), %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
LVL72:
	leaq	LC24(%rip), %rdi
	call	_printf
LVL73:
L51:
LBB53:
LBB54:
LM94:
	leaq	1344(%rsp), %r12
LBE54:
LBE53:
LM95:
	movq	%rbx, %rdi
	call	_strdup
LVL74:
LM96:
	leaq	LC25(%rip), %rsi
	movq	%rax, %rdi
LM97:
	movq	%rax, %rbp
LVL75:
LM98:
	call	_strtok
LVL76:
LM99:
	testq	%rax, %rax
LM100:
	movq	%rax, %rbx
LVL77:
LM101:
	jne	L138
	jmp	L60
LVL78:
	.align 4
L54:
LM102:
	leaq	LC26(%rip), %rdi
	call	_puts
LVL79:
L117:
LM103:
	leaq	LC25(%rip), %rsi
	xorl	%edi, %edi
	call	_strtok
LVL80:
LM104:
	testq	%rax, %rax
LM105:
	movq	%rax, %rbx
LVL81:
LM106:
	je	L60
LVL82:
L138:
LM107:
	movq	%rbx, %rdi
	call	_strlen
LVL83:
	leaq	6(%rax), %rdi
	call	_malloc
LVL84:
	testq	%rax, %rax
	movq	%rax, %r13
LVL85:
	je	L54
LM108:
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	_strcpy
LVL86:
LM109:
	movq	%r13, %rdx
L55:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	L55
	movl	%eax, %ecx
LBB57:
LBB55:
LM110:
	movq	%r12, %rsi
	movq	%r13, %rdi
LBE55:
LBE57:
LM111:
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	movl	$115, %eax
	sbbq	$3, %rdx
	movl	$1936026671, (%rdx)
	movw	%ax, 4(%rdx)
LVL87:
LBB58:
LBB56:
LM112:
	call	_stat$INODE64
LVL88:
LBE56:
LBE58:
LM113:
	testl	%eax, %eax
	jne	L162
LVL89:
LM114:
	movq	%r13, %rdi
	call	_free
LVL90:
LM115:
	movl	$0, 4(%rsp)
LVL91:
L53:
	leaq	320(%rsp), %rbx
LVL92:
LM116:
	movq	%rbp, %rdi
	call	_free
LVL93:
	leaq	288(%rsp), %rax
LM117:
	movl	$0, 24(%rsp)
	movq	%rax, 32(%rsp)
LM118:
	leaq	72(%rsp), %rax
	movq	%rax, 40(%rsp)
LM119:
	leaq	176(%rsp), %rax
LM120:
	leaq	1344(%rsp), %r12
LM121:
	movq	%rax, 48(%rsp)
LVL94:
L65:
LM122:
	call	_Janitor.constprop.0
LVL95:
LM123:
	leaq	LC27(%rip), %rdi
	xorl	%eax, %eax
	call	_printf
LVL96:
LM124:
	xorl	%esi, %esi
	movl	$1024, %edx
	movq	%rbx, %rdi
	call	_memset
LVL97:
LM125:
	movq	___stdinp@GOTPCREL(%rip), %rax
	movl	$1024, %esi
	movq	%rbx, %rdi
	movq	(%rax), %rdx
	call	_fgets
LVL98:
	testq	%rax, %rax
	je	L131
LM126:
	call	_Janitor.constprop.0
LVL99:
LM127:
	movl	$1024, %edx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	_strncpy
LVL100:
LBB59:
LBB60:
LM128:
	movq	%r12, %rcx
LM129:
	movq	%r12, %rdx
	jmp	L62
LVL101:
	.align 4
L64:
LM130:
	addq	$1, %rcx
LVL102:
LM131:
	cmpb	$32, %al
LM132:
	movb	%al, (%rdx)
LM133:
	setne	%al
	movzbl	%al, %eax
	addq	%rax, %rdx
LVL103:
L62:
LM134:
	movzbl	(%rcx), %eax
	testb	%al, %al
	jne	L64
LM135:
	movb	$0, (%rdx)
LBE60:
LBE59:
LM136:
	leaq	LC28(%rip), %rsi
	movq	%r12, %rdi
	call	_StartsWith
LVL104:
	testl	%eax, %eax
	jne	L65
LM137:
	movq	%rbx, %rdx
L66:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	L66
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	sbbq	$3, %rdx
	subq	%rbx, %rdx
LVL105:
LM138:
	subq	$1, %rdx
LVL106:
	cmpb	$10, 320(%rsp,%rdx)
	jne	L68
LM139:
	movb	$0, 320(%rsp,%rdx)
L68:
LM140:
	leaq	LC29(%rip), %rdi
	movl	$5, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	je	L131
LM141:
	leaq	LC30(%rip), %rsi
	movq	%rbx, %rdi
	call	_StartsWith
LVL107:
	testl	%eax, %eax
	je	L69
LVL108:
LM142:
	movl	$32, %esi
	movq	%rbx, %rdi
	call	_strchr
LVL109:
	testq	%rax, %rax
	je	L163
LM143:
	leaq	LC32(%rip), %rsi
	movq	%rbx, %rdi
	call	_strtok
LVL110:
LM144:
	leaq	LC32(%rip), %rsi
	xorl	%edi, %edi
	call	_strtok
LVL111:
LM145:
	movq	%rax, %rdi
	call	_chdir
LVL112:
	cmpl	$-1, %eax
	je	L164
LVL113:
L72:
LM146:
	leaq	LC34(%rip), %rsi
	movq	%rbx, %rdi
	call	_StartsWith
LVL114:
	testl	%eax, %eax
	jne	L118
LVL115:
L115:
LM147:
	movl	$1024, %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	_memset
LVL116:
	jmp	L65
LVL117:
L162:
LM148:
	movq	%r13, %rdi
	call	_free
LVL118:
	jmp	L117
LVL119:
L131:
LM149:
	addq	$2376, %rsp
LCFI37:
	xorl	%eax, %eax
	popq	%rbx
LCFI38:
	popq	%rbp
LCFI39:
	popq	%r12
LCFI40:
	popq	%r13
LCFI41:
	popq	%r14
LCFI42:
	popq	%r15
LCFI43:
	ret
LVL120:
	.align 4
L60:
LCFI44:
LM150:
	movl	$1, 4(%rsp)
	jmp	L53
LVL121:
	.align 4
L69:
LM151:
	leaq	LC34(%rip), %rsi
	movq	%rbx, %rdi
	call	_StartsWith
LVL122:
	testl	%eax, %eax
	jne	L118
	movq	%rbx, %rax
	xorl	%r15d, %r15d
LM152:
	movl	$1, %edx
	leaq	80(%rbx), %rcx
	.align 4
L87:
LVL123:
	cmpb	$38, (%rax)
	cmove	%edx, %r15d
LVL124:
	addq	$1, %rax
LVL125:
LM153:
	cmpq	%rcx, %rax
	jne	L87
LM154:
	cmpl	$1, %r15d
	je	L165
LM155:
	leaq	160(%rsp), %rdi
	xorl	%esi, %esi
	call	_gettimeofday
LVL126:
LM156:
	cmpl	$1, _isSignal(%rip)
	je	L166
L91:
LM157:
	movl	24(%rsp), %eax
	movl	%eax, _foreground(%rip)
L90:
LVL127:
LBB61:
LBB62:
LM158:
	movq	8(%rsp), %rax
LBE62:
LBE61:
LM159:
	leaq	LC32(%rip), %rsi
	movq	%rbx, %rdi
LBB64:
LBB63:
LM160:
	movq	(%rax), %rax
	movq	%rax, _arg0(%rip)
LVL128:
LBE63:
LBE64:
LM161:
	call	_strtok
LVL129:
LM162:
	movq	$0, 224(%rsp)
LM163:
	testq	%rax, %rax
	je	L121
	leaq	224(%rsp), %r13
	movl	$1, %ebp
	movq	%r13, %r14
LVL130:
L93:
LM164:
	movq	%rax, 8(%r14)
LM165:
	xorl	%edi, %edi
LM166:
	addl	$1, %ebp
LVL131:
	addq	$8, %r14
LM167:
	leaq	LC32(%rip), %rsi
	call	_strtok
LVL132:
LM168:
	testq	%rax, %rax
	jne	L93
LVL133:
L92:
LM169:
	movslq	%ebp, %rax
LVL134:
LBB65:
LBB66:
LBB67:
LBB68:
LM170:
	movl	%ebp, %edx
	xorl	%r14d, %r14d
LBE68:
LBE67:
LBE66:
LBE65:
LM171:
	movq	%rax, 16(%rsp)
LBB101:
LBB93:
LBB73:
LBB70:
LM172:
	leaq	LC46(%rip), %rsi
LBE70:
LBE73:
LBE93:
LBE101:
LM173:
	movq	$0, 224(%rsp,%rax,8)
LVL135:
LBB102:
LBB94:
LBB74:
LBB71:
LM174:
	leaq	LC47(%rip), %rdi
	xorl	%eax, %eax
	call	_printf
LVL136:
	.align 4
L95:
LBB69:
LM175:
	movq	0(%r13,%r14,8), %rsi
	leaq	LC18(%rip), %rax
	leaq	LC48(%rip), %rdi
	testq	%rsi, %rsi
	cmove	%rax, %rsi
	xorl	%eax, %eax
	addq	$1, %r14
LVL137:
	call	_printf
LVL138:
LM176:
	cmpl	%r14d, %ebp
	jg	L95
LBE69:
LM177:
	movl	$10, %edi
	call	_putchar
LVL139:
LM178:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	_fflush
LVL140:
LM179:
	movq	16(%rsp), %r14
	salq	$3, %r14
	cmpq	$0, 224(%rsp,%r14)
	jne	L167
LBE71:
LBE74:
LM180:
	movl	%ebp, %edi
	sarl	%edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	_malloc
LVL141:
LM181:
	leaq	8(%r14), %rdi
LM182:
	movq	%rax, 16(%rsp)
LVL142:
LM183:
	call	_malloc
LVL143:
LBB75:
LM184:
	cmpl	$1, %ebp
LBE75:
LM185:
	movq	%rax, %r14
LVL144:
LM186:
	movq	16(%rsp), %rax
LVL145:
	movq	%r14, (%rax)
LVL146:
LBB79:
LM187:
	je	L122
	leaq	8(%r14), %r8
	movl	$1, 28(%rsp)
	movl	$1, %edx
	leaq	LC50(%rip), %r10
LVL147:
L101:
LBB76:
LM188:
	movq	8(%r13), %rax
LVL148:
LM189:
	movl	$2, %ecx
	movq	%r10, %rdi
	movq	%rax, %rsi
	repz cmpsb
LVL149:
	jne	L98
LM190:
	cmpl	$1, %edx
	jne	L99
LM191:
	leaq	LC51(%rip), %rdi
	xorl	%eax, %eax
	call	_err_sysexit
LVL150:
L98:
LM192:
	movq	%rax, -8(%r8)
LVL151:
L119:
LBE76:
LM193:
	leal	1(%rdx), %eax
LVL152:
	addq	$8, %r13
	addq	$8, %r8
	cmpl	%eax, %ebp
	je	L97
	movslq	%eax, %rdx
LVL153:
	jmp	L101
LVL154:
L121:
	leaq	224(%rsp), %r13
LBE79:
LBE94:
LBE102:
LM194:
	movl	$1, %ebp
	jmp	L92
LVL155:
L161:
LM195:
	leaq	LC22(%rip), %rsi
	xorl	%eax, %eax
LVL156:
	leaq	LC23(%rip), %rdi
	call	_printf
LVL157:
	jmp	L51
LVL158:
L163:
LM196:
	call	_getuid
LVL159:
	movl	%eax, %edi
	call	_getpwuid
LVL160:
LM197:
	movq	48(%rax), %rdi
	call	_chdir
LVL161:
	addl	$1, %eax
	jne	L72
LM198:
	leaq	LC31(%rip), %rdi
	call	_perror
LVL162:
	jmp	L72
LVL163:
L165:
LM199:
	leaq	80(%rsp), %rdi
	call	_pipe
LVL164:
	addl	$1, %eax
	je	L168
L89:
LM200:
	call	_fork
LVL165:
	movl	%eax, 24(%rsp)
LVL166:
	jmp	L90
LVL167:
L164:
LM201:
	leaq	LC33(%rip), %rdi
	call	_perror
LVL168:
	jmp	L72
LVL169:
L167:
LBB103:
LBB95:
LBB80:
LBB72:
LM202:
	leaq	LC49(%rip), %rcx
	movl	$120, %edx
	leaq	LC10(%rip), %rsi
	leaq	___func__.3171(%rip), %rdi
	call	___assert_rtn
LVL170:
L166:
LBE72:
LBE80:
LBE95:
LBE103:
LM203:
	leaq	76(%rsp), %rsi
	xorl	%edx, %edx
	movl	$1, %edi
LM204:
	movl	$524288, 76(%rsp)
LM205:
	call	_sigprocmask
LVL171:
	jmp	L91
LVL172:
L122:
LBB104:
LBB96:
LM206:
	movl	$1, 28(%rsp)
LM207:
	xorl	%edx, %edx
LVL173:
L97:
LM208:
	cmpq	$0, -8(%r14,%rdx,8)
	je	L169
LM209:
	movq	$0, (%r14,%rdx,8)
LVL174:
LBB81:
LBB82:
LM210:
	leaq	LC54(%rip), %rdi
	xorl	%ebp, %ebp
LVL175:
	call	_puts
LVL176:
	movq	16(%rsp), %r13
	movq	%rbx, 56(%rsp)
LVL177:
L104:
LBB83:
LBB84:
LM211:
	leaq	LC55(%rip), %rdi
	movl	%ebp, %esi
	xorl	%eax, %eax
	call	_printf
LVL178:
LM212:
	movq	0(%r13,%rbp,8), %rbx
LVL179:
LM213:
	movq	(%rbx), %rsi
	testq	%rsi, %rsi
	je	L107
	.align 4
L137:
LM214:
	leaq	LC48(%rip), %rdi
	addq	$8, %rbx
LVL180:
	xorl	%eax, %eax
	call	_printf
LVL181:
LM215:
	movq	(%rbx), %rsi
	testq	%rsi, %rsi
	jne	L137
L107:
LM216:
	movl	$10, %edi
	addq	$1, %rbp
LVL182:
	call	_putchar
LVL183:
LBE84:
LM217:
	cmpl	%ebp, 28(%rsp)
	jg	L104
LBE83:
LM218:
	leaq	LC56(%rip), %rdi
	movq	56(%rsp), %rbx
LVL184:
	call	_puts
LVL185:
LM219:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	call	_fflush
LVL186:
LBE82:
LBE81:
LBB85:
LBB86:
LM220:
	call	_fork
LVL187:
	testl	%eax, %eax
	js	L170
LM221:
	je	L171
LVL188:
L109:
LBE86:
LBE85:
LM222:
	movq	16(%rsp), %rdi
	call	_free
LVL189:
LM223:
	movq	%r14, %rdi
	call	_free
LVL190:
LBE96:
LBE104:
LBB105:
LBB106:
LM224:
	call	_getpid
LVL191:
	movq	32(%rsp), %r13
	movl	%eax, %ebp
LVL192:
	jmp	L110
LVL193:
L111:
LM225:
	movl	%eax, %ecx
	movq	___stderrp@GOTPCREL(%rip), %rax
LVL194:
	movl	%ebp, %edx
	movl	288(%rsp), %r8d
	leaq	LC57(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	_fprintf
LVL195:
L110:
LM226:
	xorl	%edx, %edx
	xorl	%edi, %edi
	movq	%r13, %rsi
	call	_waitpid
LVL196:
	cmpl	$-1, %eax
	jne	L111
LBE106:
LBE105:
LM227:
	cmpl	$0, 24(%rsp)
	jne	L112
LM228:
	subl	$1, %r15d
LVL197:
	je	L172
L113:
LM229:
	movq	40(%rsp), %rsi
	xorl	%edx, %edx
	movl	_foreground(%rip), %edi
	call	_waitpid
LVL198:
LM230:
	movq	48(%rsp), %rdi
	xorl	%esi, %esi
	call	_gettimeofday
LVL199:
LM231:
	movq	176(%rsp), %rax
LM232:
	movl	$1000, %ecx
LM233:
	subq	160(%rsp), %rax
LM234:
	leaq	LC58(%rip), %rdi
LM235:
	imulq	$1000000, %rax, %rdx
	movslq	184(%rsp), %rax
	addq	%rdx, %rax
	movslq	168(%rsp), %rdx
	subq	%rdx, %rax
LVL200:
LM236:
	cqto
	idivq	%rcx
LVL201:
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	_printf
LVL202:
LM237:
	cmpl	$1, _isSignal(%rip)
	jne	L115
LBB107:
LM238:
	leaq	76(%rsp), %rsi
	xorl	%edx, %edx
	movl	$2, %edi
	call	_sigprocmask
LVL203:
LM239:
	call	_Janitor.constprop.0
LVL204:
	jmp	L115
LVL205:
L112:
LBE107:
LM240:
	testl	%r15d, %r15d
	je	L113
LVL206:
L114:
LM241:
	movl	80(%rsp), %edi
	call	_close
LVL207:
LM242:
	movl	84(%rsp), %edi
	call	_close
LVL208:
	jmp	L115
LVL209:
L168:
LM243:
	leaq	LC45(%rip), %rdi
	call	_perror
LVL210:
	jmp	L89
LVL211:
L170:
LBB108:
LBB97:
LBB89:
LBB87:
LM244:
	leaq	LC12(%rip), %rdi
	xorl	%eax, %eax
LVL212:
	call	_err_syswarn.constprop.3
LVL213:
	jmp	L109
LVL214:
L169:
LBE87:
LBE89:
LM245:
	leaq	LC53(%rip), %rdi
	xorl	%eax, %eax
	call	_err_sysexit
LVL215:
L118:
LBE97:
LBE108:
LM246:
	leaq	LC35(%rip), %rdi
	call	_getenv
LVL216:
LM247:
	testq	%rax, %rax
	je	L173
LM248:
	movq	%rax, 144(%rsp)
LVL217:
L76:
LM249:
	movl	$1, %edi
LBB109:
LBB110:
LM250:
	xorl	%ebp, %ebp
LM251:
	xorl	%ebx, %ebx
LBE110:
LBE109:
LM252:
	call	_malloc
LVL218:
LM253:
	leaq	LC37(%rip), %rsi
LM254:
	movq	$0, 280(%rsp)
LM255:
	movb	$0, (%rax)
LM256:
	leaq	144(%rsp), %r13
LM257:
	movq	%rax, 272(%rsp)
LM258:
	leaq	112(%rsp), %rax
LVL219:
	movq	%rax, 288(%rsp)
LM259:
	leaq	256(%rsp), %rax
LM260:
	movq	%rsi, 256(%rsp)
LM261:
	leaq	LC38(%rip), %rsi
LM262:
	movq	%rax, 296(%rsp)
LM263:
	leaq	128(%rsp), %rax
LM264:
	movq	%rsi, 264(%rsp)
	leaq	96(%rsp), %r14
LM265:
	movq	%rax, 304(%rsp)
LM266:
	movq	%r13, 312(%rsp)
LVL220:
L84:
LBB125:
LBB123:
LM267:
	movq	%r14, %rdi
	call	_pipe
LVL221:
	addl	$1, %eax
	je	L174
LM268:
	movl	100(%rsp), %r12d
LVL222:
LBB111:
LBB112:
LM269:
	call	_fork
LVL223:
	testl	%eax, %eax
	jne	L78
LBE112:
LBE111:
LM270:
	movslq	%ebx, %rbx
LVL224:
LBB118:
LBB113:
LM271:
	testl	%ebp, %ebp
LBE113:
LBE118:
LM272:
	leaq	288(%rsp,%rbx,8), %rbx
LVL225:
LBB119:
LBB114:
LM273:
	jne	L175
LVL226:
L79:
LM274:
	cmpl	$1, %r12d
	je	L81
LM275:
	movl	$1, %esi
	movl	%r12d, %edi
	call	_dup2
LVL227:
	testl	%eax, %eax
	js	L176
LM276:
	movl	%r12d, %edi
	call	_close
LVL228:
L81:
LM277:
	movq	(%rbx), %rbx
	movq	(%rbx), %rbp
LVL229:
	call	_getpid
LVL230:
	leaq	LC42(%rip), %rsi
	movl	%eax, %edx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	%rbp, %rcx
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	_fprintf
LVL231:
LM278:
	movq	(%rbx), %rdi
	movq	%rbx, %rsi
	call	_execvp
LVL232:
LM279:
	movq	(%rbx), %rsi
	leaq	LC43(%rip), %rdi
	xorl	%eax, %eax
	call	_err_syserr
LVL233:
L175:
LM280:
	xorl	%esi, %esi
	movl	%ebp, %edi
	call	_dup2
LVL234:
	testl	%eax, %eax
	js	L177
LM281:
	movl	%ebp, %edi
	call	_close
LVL235:
	jmp	L79
LVL236:
L78:
LM282:
	js	L178
LBE114:
LBE119:
LM283:
	movl	100(%rsp), %edi
LM284:
	addl	$1, %ebx
LVL237:
LM285:
	call	_close
LVL238:
LM286:
	cmpl	$3, %ebx
LM287:
	movl	96(%rsp), %ebp
LVL239:
LM288:
	jne	L84
LM289:
	xorl	%esi, %esi
	movl	%ebp, %edi
	call	_dup2
LVL240:
	testl	%eax, %eax
	js	L179
LM290:
	movq	144(%rsp), %rbx
LVL241:
	call	_getpid
LVL242:
	leaq	LC42(%rip), %rsi
	movl	%eax, %edx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	_fprintf
LVL243:
LM291:
	movq	144(%rsp), %rdi
	movq	%r13, %rsi
	call	_execvp
LVL244:
LM292:
	movq	144(%rsp), %rsi
	leaq	LC43(%rip), %rdi
	xorl	%eax, %eax
	call	_err_syserr
LVL245:
L177:
LBB120:
LBB115:
LM293:
	movq	(%rbx), %rax
	leaq	LC40(%rip), %rdi
	movq	(%rax), %rsi
	xorl	%eax, %eax
	call	_err_syserr
LVL246:
L179:
LBE115:
LBE120:
LM294:
	movq	144(%rsp), %rsi
	leaq	LC40(%rip), %rdi
	xorl	%eax, %eax
	call	_err_syserr
LVL247:
L178:
LBB121:
LBB116:
LM295:
	leaq	LC44(%rip), %rdi
	xorl	%eax, %eax
LVL248:
	call	_err_syserr
LVL249:
L174:
LBE116:
LBE121:
LM296:
	leaq	LC39(%rip), %rdi
	xorl	%eax, %eax
	call	_err_syserr
LVL250:
L173:
LBE123:
LBE125:
LM297:
	cmpl	$0, 4(%rsp)
	leaq	LC21(%rip), %rdx
	leaq	LC36(%rip), %rax
LVL251:
	cmove	%rdx, %rax
	movq	%rax, 144(%rsp)
	jmp	L76
LVL252:
L171:
LBB126:
LBB98:
LBB90:
LBB88:
LM298:
	movq	16(%rsp), %rsi
	movl	28(%rsp), %edi
	call	_exec_nth_command
LVL253:
L172:
LBE88:
LBE90:
LBE98:
LBE126:
LM299:
	movl	80(%rsp), %edi
	xorl	%esi, %esi
	call	_dup2
LVL254:
LM300:
	movl	80(%rsp), %edi
	call	_close
LVL255:
LM301:
	movl	84(%rsp), %edi
	call	_close
LVL256:
	jmp	L114
LVL257:
L99:
LBB127:
LBB99:
LBB91:
LBB77:
LM302:
	cmpq	$0, -16(%r8)
	je	L180
LVL258:
LM303:
	movl	28(%rsp), %esi
LM304:
	movq	$0, -8(%r8)
LVL259:
LM305:
	movq	16(%rsp), %rdi
	movslq	%esi, %rax
	movq	%r8, (%rdi,%rax,8)
	movl	%esi, %eax
	addl	$1, %eax
LVL260:
	movl	%eax, 28(%rsp)
	jmp	L119
LVL261:
L176:
LBE77:
LBE91:
LBE99:
LBE127:
LBB128:
LBB124:
LBB122:
LBB117:
LM306:
	movq	(%rbx), %rax
	leaq	LC41(%rip), %rdi
	movq	(%rax), %rsi
	xorl	%eax, %eax
	call	_err_syserr
LVL262:
L180:
LBE117:
LBE122:
LBE124:
LBE128:
LBB129:
LBB100:
LBB92:
LBB78:
LM307:
	leaq	LC52(%rip), %rdi
	xorl	%eax, %eax
	call	_err_sysexit
LVL263:
LBE78:
LBE92:
LBE100:
LBE129:
LFE22:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE59:
	.section __TEXT,__text_startup,regular,pure_instructions
LHOTE59:
	.const
	.align 4
___func__.3142:
	.ascii "exec_nth_command\0"
	.align 3
___func__.3171:
	.ascii "dump_argv\0"
	.globl _foreground
	.data
	.align 2
_foreground:
	.long	-1
	.cstring
LC60:
	.ascii "<undefined>\0"
	.data
	.align 3
_arg0:
	.quad	LC60
	.globl _isSignal
	.zerofill __DATA,__pu_bss2,_isSignal,4,2
	.section __DWARF,__debug_frame,regular,debug
Lsection__debug_frame:
Lframe0:
	.set L$set$0,LECIE0-LSCIE0
	.long L$set$0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE0:
LSFDE0:
	.set L$set$1,LEFDE0-LASFDE0
	.long L$set$1
LASFDE0:
	.set L$set$2,Lframe0-Lsection__debug_frame
	.long L$set$2
	.quad	LFB21
	.set L$set$3,LFE21-LFB21
	.quad L$set$3
	.align 3
LEFDE0:
LSFDE2:
	.set L$set$4,LEFDE2-LASFDE2
	.long L$set$4
LASFDE2:
	.set L$set$5,Lframe0-Lsection__debug_frame
	.long L$set$5
	.quad	LFB15
	.set L$set$6,LFE15-LFB15
	.quad L$set$6
	.byte	0x4
	.set L$set$7,LCFI0-LFB15
	.long L$set$7
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$8,LCFI1-LCFI0
	.long L$set$8
	.byte	0xe
	.byte	0x18
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$9,LCFI2-LCFI1
	.long L$set$9
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$10,LCFI3-LCFI2
	.long L$set$10
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$11,LCFI4-LCFI3
	.long L$set$11
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$12,LCFI5-LCFI4
	.long L$set$12
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE2:
LSFDE4:
	.set L$set$13,LEFDE4-LASFDE4
	.long L$set$13
LASFDE4:
	.set L$set$14,Lframe0-Lsection__debug_frame
	.long L$set$14
	.quad	LFB14
	.set L$set$15,LFE14-LFB14
	.quad L$set$15
	.byte	0x4
	.set L$set$16,LCFI6-LFB14
	.long L$set$16
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$17,LCFI7-LCFI6
	.long L$set$17
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$18,LCFI8-LCFI7
	.long L$set$18
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$19,LCFI9-LCFI8
	.long L$set$19
	.byte	0xe
	.byte	0xf0,0x1
	.align 3
LEFDE4:
LSFDE6:
	.set L$set$20,LEFDE6-LASFDE6
	.long L$set$20
LASFDE6:
	.set L$set$21,Lframe0-Lsection__debug_frame
	.long L$set$21
	.quad	LFB11
	.set L$set$22,LFE11-LFB11
	.quad L$set$22
	.byte	0x4
	.set L$set$23,LCFI10-LFB11
	.long L$set$23
	.byte	0xe
	.byte	0x10
	.byte	0x8d
	.byte	0x2
	.byte	0x4
	.set L$set$24,LCFI11-LCFI10
	.long L$set$24
	.byte	0xe
	.byte	0x18
	.byte	0x8c
	.byte	0x3
	.byte	0x4
	.set L$set$25,LCFI12-LCFI11
	.long L$set$25
	.byte	0xe
	.byte	0x20
	.byte	0x86
	.byte	0x4
	.byte	0x4
	.set L$set$26,LCFI13-LCFI12
	.long L$set$26
	.byte	0xe
	.byte	0x28
	.byte	0x83
	.byte	0x5
	.byte	0x4
	.set L$set$27,LCFI14-LCFI13
	.long L$set$27
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$28,LCFI15-LCFI14
	.long L$set$28
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$29,LCFI16-LCFI15
	.long L$set$29
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$30,LCFI17-LCFI16
	.long L$set$30
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$31,LCFI18-LCFI17
	.long L$set$31
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$32,LCFI19-LCFI18
	.long L$set$32
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE6:
LSFDE8:
	.set L$set$33,LEFDE8-LASFDE8
	.long L$set$33
LASFDE8:
	.set L$set$34,Lframe0-Lsection__debug_frame
	.long L$set$34
	.quad	LFB13
	.set L$set$35,LFE13-LFB13
	.quad L$set$35
	.byte	0x4
	.set L$set$36,LCFI20-LFB13
	.long L$set$36
	.byte	0xe
	.byte	0xe0,0x1
	.align 3
LEFDE8:
LSFDE10:
	.set L$set$37,LEFDE10-LASFDE10
	.long L$set$37
LASFDE10:
	.set L$set$38,Lframe0-Lsection__debug_frame
	.long L$set$38
	.quad	LFB3
	.set L$set$39,LFE3-LFB3
	.quad L$set$39
	.byte	0x4
	.set L$set$40,LCFI21-LFB3
	.long L$set$40
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$41,LCFI22-LCFI21
	.long L$set$41
	.byte	0xe
	.byte	0x18
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$42,LCFI23-LCFI22
	.long L$set$42
	.byte	0xe
	.byte	0x30
	.align 3
LEFDE10:
LSFDE12:
	.set L$set$43,LEFDE12-LASFDE12
	.long L$set$43
LASFDE12:
	.set L$set$44,Lframe0-Lsection__debug_frame
	.long L$set$44
	.quad	LFB26
	.set L$set$45,LFE26-LFB26
	.quad L$set$45
	.byte	0x4
	.set L$set$46,LCFI24-LFB26
	.long L$set$46
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$47,LCFI25-LCFI24
	.long L$set$47
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$48,LCFI26-LCFI25
	.long L$set$48
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$49,LCFI27-LCFI26
	.long L$set$49
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE12:
LSFDE14:
	.set L$set$50,LEFDE14-LASFDE14
	.long L$set$50
LASFDE14:
	.set L$set$51,Lframe0-Lsection__debug_frame
	.long L$set$51
	.quad	LFB23
	.set L$set$52,LFE23-LFB23
	.quad L$set$52
	.byte	0x4
	.set L$set$53,LCFI28-LFB23
	.long L$set$53
	.byte	0xe
	.byte	0xe0,0x1
	.byte	0x4
	.set L$set$54,LCFI29-LCFI28
	.long L$set$54
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE14:
LSFDE16:
	.set L$set$55,LEFDE16-LASFDE16
	.long L$set$55
LASFDE16:
	.set L$set$56,Lframe0-Lsection__debug_frame
	.long L$set$56
	.quad	LFB22
	.set L$set$57,LFE22-LFB22
	.quad L$set$57
	.byte	0x4
	.set L$set$58,LCFI30-LFB22
	.long L$set$58
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$59,LCFI31-LCFI30
	.long L$set$59
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$60,LCFI32-LCFI31
	.long L$set$60
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$61,LCFI33-LCFI32
	.long L$set$61
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$62,LCFI34-LCFI33
	.long L$set$62
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$63,LCFI35-LCFI34
	.long L$set$63
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$64,LCFI36-LCFI35
	.long L$set$64
	.byte	0xe
	.byte	0x80,0x13
	.byte	0x4
	.set L$set$65,LCFI37-LCFI36
	.long L$set$65
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$66,LCFI38-LCFI37
	.long L$set$66
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$67,LCFI39-LCFI38
	.long L$set$67
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$68,LCFI40-LCFI39
	.long L$set$68
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$69,LCFI41-LCFI40
	.long L$set$69
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$70,LCFI42-LCFI41
	.long L$set$70
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$71,LCFI43-LCFI42
	.long L$set$71
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$72,LCFI44-LCFI43
	.long L$set$72
	.byte	0xb
	.align 3
LEFDE16:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$73,LECIE1-LSCIE1
	.long L$set$73
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE19:
	.set L$set$74,LEFDE19-LASFDE19
	.long L$set$74
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB21-.
	.set L$set$75,LFE21-LFB21
	.quad L$set$75
	.byte	0
	.align 3
LEFDE19:
LSFDE21:
	.set L$set$76,LEFDE21-LASFDE21
	.long L$set$76
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFB15-.
	.set L$set$77,LFE15-LFB15
	.quad L$set$77
	.byte	0
	.byte	0x4
	.set L$set$78,LCFI0-LFB15
	.long L$set$78
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$79,LCFI1-LCFI0
	.long L$set$79
	.byte	0xe
	.byte	0x18
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$80,LCFI2-LCFI1
	.long L$set$80
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$81,LCFI3-LCFI2
	.long L$set$81
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$82,LCFI4-LCFI3
	.long L$set$82
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$83,LCFI5-LCFI4
	.long L$set$83
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE21:
LSFDE23:
	.set L$set$84,LEFDE23-LASFDE23
	.long L$set$84
LASFDE23:
	.long	LASFDE23-EH_frame1
	.quad	LFB14-.
	.set L$set$85,LFE14-LFB14
	.quad L$set$85
	.byte	0
	.byte	0x4
	.set L$set$86,LCFI6-LFB14
	.long L$set$86
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$87,LCFI7-LCFI6
	.long L$set$87
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$88,LCFI8-LCFI7
	.long L$set$88
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$89,LCFI9-LCFI8
	.long L$set$89
	.byte	0xe
	.byte	0xf0,0x1
	.align 3
LEFDE23:
LSFDE25:
	.set L$set$90,LEFDE25-LASFDE25
	.long L$set$90
LASFDE25:
	.long	LASFDE25-EH_frame1
	.quad	LFB11-.
	.set L$set$91,LFE11-LFB11
	.quad L$set$91
	.byte	0
	.byte	0x4
	.set L$set$92,LCFI10-LFB11
	.long L$set$92
	.byte	0xe
	.byte	0x10
	.byte	0x8d
	.byte	0x2
	.byte	0x4
	.set L$set$93,LCFI11-LCFI10
	.long L$set$93
	.byte	0xe
	.byte	0x18
	.byte	0x8c
	.byte	0x3
	.byte	0x4
	.set L$set$94,LCFI12-LCFI11
	.long L$set$94
	.byte	0xe
	.byte	0x20
	.byte	0x86
	.byte	0x4
	.byte	0x4
	.set L$set$95,LCFI13-LCFI12
	.long L$set$95
	.byte	0xe
	.byte	0x28
	.byte	0x83
	.byte	0x5
	.byte	0x4
	.set L$set$96,LCFI14-LCFI13
	.long L$set$96
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$97,LCFI15-LCFI14
	.long L$set$97
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$98,LCFI16-LCFI15
	.long L$set$98
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$99,LCFI17-LCFI16
	.long L$set$99
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$100,LCFI18-LCFI17
	.long L$set$100
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$101,LCFI19-LCFI18
	.long L$set$101
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE25:
LSFDE27:
	.set L$set$102,LEFDE27-LASFDE27
	.long L$set$102
LASFDE27:
	.long	LASFDE27-EH_frame1
	.quad	LFB13-.
	.set L$set$103,LFE13-LFB13
	.quad L$set$103
	.byte	0
	.byte	0x4
	.set L$set$104,LCFI20-LFB13
	.long L$set$104
	.byte	0xe
	.byte	0xe0,0x1
	.align 3
LEFDE27:
LSFDE29:
	.set L$set$105,LEFDE29-LASFDE29
	.long L$set$105
LASFDE29:
	.long	LASFDE29-EH_frame1
	.quad	LFB3-.
	.set L$set$106,LFE3-LFB3
	.quad L$set$106
	.byte	0
	.byte	0x4
	.set L$set$107,LCFI21-LFB3
	.long L$set$107
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$108,LCFI22-LCFI21
	.long L$set$108
	.byte	0xe
	.byte	0x18
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$109,LCFI23-LCFI22
	.long L$set$109
	.byte	0xe
	.byte	0x30
	.align 3
LEFDE29:
LSFDE31:
	.set L$set$110,LEFDE31-LASFDE31
	.long L$set$110
LASFDE31:
	.long	LASFDE31-EH_frame1
	.quad	LFB26-.
	.set L$set$111,LFE26-LFB26
	.quad L$set$111
	.byte	0
	.byte	0x4
	.set L$set$112,LCFI24-LFB26
	.long L$set$112
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$113,LCFI25-LCFI24
	.long L$set$113
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$114,LCFI26-LCFI25
	.long L$set$114
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$115,LCFI27-LCFI26
	.long L$set$115
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE31:
LSFDE33:
	.set L$set$116,LEFDE33-LASFDE33
	.long L$set$116
LASFDE33:
	.long	LASFDE33-EH_frame1
	.quad	LFB23-.
	.set L$set$117,LFE23-LFB23
	.quad L$set$117
	.byte	0
	.byte	0x4
	.set L$set$118,LCFI28-LFB23
	.long L$set$118
	.byte	0xe
	.byte	0xe0,0x1
	.byte	0x4
	.set L$set$119,LCFI29-LCFI28
	.long L$set$119
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE33:
LSFDE35:
	.set L$set$120,LEFDE35-LASFDE35
	.long L$set$120
LASFDE35:
	.long	LASFDE35-EH_frame1
	.quad	LFB22-.
	.set L$set$121,LFE22-LFB22
	.quad L$set$121
	.byte	0
	.byte	0x4
	.set L$set$122,LCFI30-LFB22
	.long L$set$122
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$123,LCFI31-LCFI30
	.long L$set$123
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$124,LCFI32-LCFI31
	.long L$set$124
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$125,LCFI33-LCFI32
	.long L$set$125
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$126,LCFI34-LCFI33
	.long L$set$126
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$127,LCFI35-LCFI34
	.long L$set$127
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$128,LCFI36-LCFI35
	.long L$set$128
	.byte	0xe
	.byte	0x80,0x13
	.byte	0x4
	.set L$set$129,LCFI37-LCFI36
	.long L$set$129
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$130,LCFI38-LCFI37
	.long L$set$130
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$131,LCFI39-LCFI38
	.long L$set$131
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$132,LCFI40-LCFI39
	.long L$set$132
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$133,LCFI41-LCFI40
	.long L$set$133
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$134,LCFI42-LCFI41
	.long L$set$134
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$135,LCFI43-LCFI42
	.long L$set$135
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$136,LCFI44-LCFI43
	.long L$set$136
	.byte	0xb
	.align 3
LEFDE35:
	.text
Letext0:
	.section __TEXT,__text_cold,regular,pure_instructions
Letext_cold0:
	.section __DWARF,__debug_info,regular,debug
Lsection__debug_info:
Ldebug_info0:
	.long	0x1a0a
	.word	0x2
	.set L$set$137,Ldebug_abbrev0-Lsection__debug_abbrev
	.long L$set$137
	.byte	0x8
	.byte	0x1
	.ascii "GNU C11 5.2.0 -fPIC -feliminate-unused-debug-symbols -mmacosx-version-min=10.11.4 -mtune=core2 -g -O2 -std=c11\0"
	.byte	0x1
	.ascii "c_posix.c\0"
	.ascii "/Users/jleffler/soq\0"
	.quad	Ltext0
	.quad	Letext0
	.set L$set$138,Ldebug_line0-Lsection__debug_line
	.long L$set$138
	.byte	0x1
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.byte	0x3
	.ascii "__uint16_t\0"
	.byte	0x2
	.byte	0x2b
	.long	0xee
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.byte	0x3
	.ascii "__int32_t\0"
	.byte	0x2
	.byte	0x2c
	.long	0x115
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.byte	0x3
	.ascii "__uint32_t\0"
	.byte	0x2
	.byte	0x2d
	.long	0x12e
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.byte	0x3
	.ascii "__int64_t\0"
	.byte	0x2
	.byte	0x2e
	.long	0x14f
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.byte	0x3
	.ascii "__uint64_t\0"
	.byte	0x2
	.byte	0x2f
	.long	0x172
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "sizetype\0"
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.byte	0x3
	.ascii "__darwin_size_t\0"
	.byte	0x2
	.byte	0x5c
	.long	0x1c3
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long unsigned int\0"
	.byte	0x3
	.ascii "__darwin_va_list\0"
	.byte	0x2
	.byte	0x62
	.long	0x1f0
	.byte	0x4
	.long	0x200
	.long	0x200
	.byte	0x5
	.long	0x198
	.byte	0
	.byte	0
	.byte	0x6
	.ascii "__va_list_tag\0"
	.byte	0x18
	.byte	0x3
	.byte	0
	.long	0x273
	.byte	0x7
	.ascii "gp_offset\0"
	.byte	0x3
	.byte	0
	.long	0x12e
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "fp_offset\0"
	.byte	0x3
	.byte	0
	.long	0x12e
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x7
	.ascii "overflow_arg_area\0"
	.byte	0x3
	.byte	0
	.long	0x273
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x7
	.ascii "reg_save_area\0"
	.byte	0x3
	.byte	0
	.long	0x273
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0
	.byte	0x8
	.byte	0x8
	.byte	0x3
	.ascii "__darwin_time_t\0"
	.byte	0x2
	.byte	0x78
	.long	0x18c
	.byte	0x3
	.ascii "__darwin_blkcnt_t\0"
	.byte	0x4
	.byte	0x37
	.long	0x13e
	.byte	0x3
	.ascii "__darwin_blksize_t\0"
	.byte	0x4
	.byte	0x38
	.long	0x104
	.byte	0x3
	.ascii "__darwin_dev_t\0"
	.byte	0x4
	.byte	0x39
	.long	0x104
	.byte	0x3
	.ascii "__darwin_gid_t\0"
	.byte	0x4
	.byte	0x3c
	.long	0x11c
	.byte	0x3
	.ascii "__darwin_ino64_t\0"
	.byte	0x4
	.byte	0x3e
	.long	0x160
	.byte	0x3
	.ascii "__darwin_mode_t\0"
	.byte	0x4
	.byte	0x46
	.long	0xdc
	.byte	0x3
	.ascii "__darwin_off_t\0"
	.byte	0x4
	.byte	0x47
	.long	0x13e
	.byte	0x3
	.ascii "__darwin_pid_t\0"
	.byte	0x4
	.byte	0x48
	.long	0x104
	.byte	0x3
	.ascii "__darwin_sigset_t\0"
	.byte	0x4
	.byte	0x49
	.long	0x11c
	.byte	0x3
	.ascii "__darwin_suseconds_t\0"
	.byte	0x4
	.byte	0x4a
	.long	0x104
	.byte	0x3
	.ascii "__darwin_uid_t\0"
	.byte	0x4
	.byte	0x4b
	.long	0x11c
	.byte	0x3
	.ascii "gid_t\0"
	.byte	0x5
	.byte	0x1e
	.long	0x2d5
	.byte	0x3
	.ascii "size_t\0"
	.byte	0x6
	.byte	0x1e
	.long	0x1ac
	.byte	0x3
	.ascii "uid_t\0"
	.byte	0x7
	.byte	0x1e
	.long	0x37b
	.byte	0x6
	.ascii "passwd\0"
	.byte	0x48
	.byte	0x8
	.byte	0x54
	.long	0x483
	.byte	0x7
	.ascii "pw_name\0"
	.byte	0x8
	.byte	0x55
	.long	0x483
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "pw_passwd\0"
	.byte	0x8
	.byte	0x56
	.long	0x483
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x7
	.ascii "pw_uid\0"
	.byte	0x8
	.byte	0x57
	.long	0x3ac
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x7
	.ascii "pw_gid\0"
	.byte	0x8
	.byte	0x58
	.long	0x391
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x7
	.ascii "pw_change\0"
	.byte	0x8
	.byte	0x59
	.long	0x275
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x7
	.ascii "pw_class\0"
	.byte	0x8
	.byte	0x5a
	.long	0x483
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x7
	.ascii "pw_gecos\0"
	.byte	0x8
	.byte	0x5b
	.long	0x483
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x7
	.ascii "pw_dir\0"
	.byte	0x8
	.byte	0x5c
	.long	0x483
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x7
	.ascii "pw_shell\0"
	.byte	0x8
	.byte	0x5d
	.long	0x483
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x7
	.ascii "pw_expire\0"
	.byte	0x8
	.byte	0x5e
	.long	0x275
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x1a4
	.byte	0x4
	.long	0x1a4
	.long	0x499
	.byte	0x5
	.long	0x198
	.byte	0x9
	.byte	0
	.byte	0x4
	.long	0x115
	.long	0x4a9
	.byte	0x5
	.long	0x198
	.byte	0x1
	.byte	0
	.byte	0x3
	.ascii "pid_t\0"
	.byte	0x9
	.byte	0x1e
	.long	0x330
	.byte	0x3
	.ascii "sigset_t\0"
	.byte	0xa
	.byte	0x1e
	.long	0x346
	.byte	0xa
	.ascii "sigval\0"
	.byte	0x8
	.byte	0xb
	.byte	0x9e
	.long	0x4f8
	.byte	0xb
	.ascii "sival_int\0"
	.byte	0xb
	.byte	0xa0
	.long	0x115
	.byte	0xb
	.ascii "sival_ptr\0"
	.byte	0xb
	.byte	0xa1
	.long	0x273
	.byte	0
	.byte	0x6
	.ascii "__siginfo\0"
	.byte	0x68
	.byte	0xb
	.byte	0xb1
	.long	0x5c0
	.byte	0x7
	.ascii "si_signo\0"
	.byte	0xb
	.byte	0xb2
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "si_errno\0"
	.byte	0xb
	.byte	0xb3
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x7
	.ascii "si_code\0"
	.byte	0xb
	.byte	0xb4
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x7
	.ascii "si_pid\0"
	.byte	0xb
	.byte	0xb5
	.long	0x4a9
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x7
	.ascii "si_uid\0"
	.byte	0xb
	.byte	0xb6
	.long	0x3ac
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x7
	.ascii "si_status\0"
	.byte	0xb
	.byte	0xb7
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x7
	.ascii "si_addr\0"
	.byte	0xb
	.byte	0xb8
	.long	0x273
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x7
	.ascii "si_value\0"
	.byte	0xb
	.byte	0xb9
	.long	0x4c6
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x7
	.ascii "si_band\0"
	.byte	0xb
	.byte	0xba
	.long	0x18c
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x7
	.ascii "__pad\0"
	.byte	0xb
	.byte	0xbb
	.long	0x5c0
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0
	.byte	0x4
	.long	0x1c3
	.long	0x5d0
	.byte	0x5
	.long	0x198
	.byte	0x6
	.byte	0
	.byte	0x3
	.ascii "siginfo_t\0"
	.byte	0xb
	.byte	0xbc
	.long	0x4f8
	.byte	0xc
	.set L$set$139,LASF0-Lsection__debug_str
	.long L$set$139
	.byte	0x8
	.byte	0xb
	.word	0x10d
	.long	0x61b
	.byte	0xd
	.ascii "__sa_handler\0"
	.byte	0xb
	.word	0x10e
	.long	0x627
	.byte	0xd
	.ascii "__sa_sigaction\0"
	.byte	0xb
	.word	0x10f
	.long	0x649
	.byte	0
	.byte	0xe
	.byte	0x1
	.long	0x627
	.byte	0xf
	.long	0x115
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x61b
	.byte	0xe
	.byte	0x1
	.long	0x643
	.byte	0xf
	.long	0x115
	.byte	0xf
	.long	0x643
	.byte	0xf
	.long	0x273
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x4f8
	.byte	0x9
	.byte	0x8
	.long	0x62d
	.byte	0x9
	.byte	0x8
	.long	0x5d0
	.byte	0x10
	.ascii "sigaction\0"
	.byte	0x10
	.byte	0xb
	.word	0x11e
	.long	0x69f
	.byte	0x11
	.set L$set$140,LASF0-Lsection__debug_str
	.long L$set$140
	.byte	0xb
	.word	0x11f
	.long	0x5e1
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x12
	.ascii "sa_mask\0"
	.byte	0xb
	.word	0x120
	.long	0x4b6
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x12
	.ascii "sa_flags\0"
	.byte	0xb
	.word	0x121
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0
	.byte	0x3
	.ascii "fpos_t\0"
	.byte	0xc
	.byte	0x4d
	.long	0x31a
	.byte	0x6
	.ascii "__sbuf\0"
	.byte	0x10
	.byte	0xc
	.byte	0x58
	.long	0x6dd
	.byte	0x7
	.ascii "_base\0"
	.byte	0xc
	.byte	0x59
	.long	0x6dd
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "_size\0"
	.byte	0xc
	.byte	0x5a
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0xbe
	.byte	0x6
	.ascii "__sFILE\0"
	.byte	0x98
	.byte	0xc
	.byte	0x7a
	.long	0x833
	.byte	0x7
	.ascii "_p\0"
	.byte	0xc
	.byte	0x7b
	.long	0x6dd
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "_r\0"
	.byte	0xc
	.byte	0x7c
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x7
	.ascii "_w\0"
	.byte	0xc
	.byte	0x7d
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x7
	.ascii "_flags\0"
	.byte	0xc
	.byte	0x7e
	.long	0xcf
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x7
	.ascii "_file\0"
	.byte	0xc
	.byte	0x7f
	.long	0xcf
	.byte	0x2
	.byte	0x23
	.byte	0x12
	.byte	0x7
	.ascii "_bf\0"
	.byte	0xc
	.byte	0x80
	.long	0x6ad
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x7
	.ascii "_lbfsize\0"
	.byte	0xc
	.byte	0x81
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x7
	.ascii "_cookie\0"
	.byte	0xc
	.byte	0x84
	.long	0x273
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x7
	.ascii "_close\0"
	.byte	0xc
	.byte	0x85
	.long	0x843
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x7
	.ascii "_read\0"
	.byte	0xc
	.byte	0x86
	.long	0x863
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x7
	.ascii "_seek\0"
	.byte	0xc
	.byte	0x87
	.long	0x883
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x7
	.ascii "_write\0"
	.byte	0xc
	.byte	0x88
	.long	0x8ae
	.byte	0x2
	.byte	0x23
	.byte	0x50
	.byte	0x7
	.ascii "_ub\0"
	.byte	0xc
	.byte	0x8b
	.long	0x6ad
	.byte	0x2
	.byte	0x23
	.byte	0x58
	.byte	0x7
	.ascii "_extra\0"
	.byte	0xc
	.byte	0x8c
	.long	0x8bf
	.byte	0x2
	.byte	0x23
	.byte	0x68
	.byte	0x7
	.ascii "_ur\0"
	.byte	0xc
	.byte	0x8d
	.long	0x115
	.byte	0x2
	.byte	0x23
	.byte	0x70
	.byte	0x7
	.ascii "_ubuf\0"
	.byte	0xc
	.byte	0x90
	.long	0x8c5
	.byte	0x2
	.byte	0x23
	.byte	0x74
	.byte	0x7
	.ascii "_nbuf\0"
	.byte	0xc
	.byte	0x91
	.long	0x8d5
	.byte	0x2
	.byte	0x23
	.byte	0x77
	.byte	0x7
	.ascii "_lb\0"
	.byte	0xc
	.byte	0x94
	.long	0x6ad
	.byte	0x2
	.byte	0x23
	.byte	0x78
	.byte	0x7
	.ascii "_blksize\0"
	.byte	0xc
	.byte	0x97
	.long	0x115
	.byte	0x3
	.byte	0x23
	.byte	0x88,0x1
	.byte	0x7
	.ascii "_offset\0"
	.byte	0xc
	.byte	0x98
	.long	0x69f
	.byte	0x3
	.byte	0x23
	.byte	0x90,0x1
	.byte	0
	.byte	0x13
	.byte	0x1
	.long	0x115
	.long	0x843
	.byte	0xf
	.long	0x273
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x833
	.byte	0x13
	.byte	0x1
	.long	0x115
	.long	0x863
	.byte	0xf
	.long	0x273
	.byte	0xf
	.long	0x483
	.byte	0xf
	.long	0x115
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x849
	.byte	0x13
	.byte	0x1
	.long	0x69f
	.long	0x883
	.byte	0xf
	.long	0x273
	.byte	0xf
	.long	0x69f
	.byte	0xf
	.long	0x115
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x869
	.byte	0x13
	.byte	0x1
	.long	0x115
	.long	0x8a3
	.byte	0xf
	.long	0x273
	.byte	0xf
	.long	0x8a3
	.byte	0xf
	.long	0x115
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x8a9
	.byte	0x14
	.long	0x1a4
	.byte	0x9
	.byte	0x8
	.long	0x889
	.byte	0x15
	.ascii "__sFILEX\0"
	.byte	0x1
	.byte	0x9
	.byte	0x8
	.long	0x8b4
	.byte	0x4
	.long	0xbe
	.long	0x8d5
	.byte	0x5
	.long	0x198
	.byte	0x2
	.byte	0
	.byte	0x4
	.long	0xbe
	.long	0x8e5
	.byte	0x5
	.long	0x198
	.byte	0
	.byte	0
	.byte	0x3
	.ascii "FILE\0"
	.byte	0xc
	.byte	0x99
	.long	0x6e3
	.byte	0x6
	.ascii "timeval\0"
	.byte	0x10
	.byte	0xd
	.byte	0x1e
	.long	0x925
	.byte	0x7
	.ascii "tv_sec\0"
	.byte	0xd
	.byte	0x20
	.long	0x275
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "tv_usec\0"
	.byte	0xd
	.byte	0x21
	.long	0x35f
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0
	.byte	0x3
	.ascii "blkcnt_t\0"
	.byte	0xe
	.byte	0x1e
	.long	0x28c
	.byte	0x3
	.ascii "blksize_t\0"
	.byte	0xf
	.byte	0x1e
	.long	0x2a5
	.byte	0x3
	.ascii "dev_t\0"
	.byte	0x10
	.byte	0x1e
	.long	0x2bf
	.byte	0x3
	.ascii "mode_t\0"
	.byte	0x11
	.byte	0x1e
	.long	0x303
	.byte	0x3
	.ascii "nlink_t\0"
	.byte	0x12
	.byte	0x1e
	.long	0xdc
	.byte	0x3
	.ascii "off_t\0"
	.byte	0x13
	.byte	0x1e
	.long	0x31a
	.byte	0x3
	.ascii "time_t\0"
	.byte	0x14
	.byte	0x1e
	.long	0x275
	.byte	0x6
	.ascii "stat\0"
	.byte	0x90
	.byte	0x15
	.byte	0xb6
	.long	0xb4c
	.byte	0x7
	.ascii "st_dev\0"
	.byte	0x15
	.byte	0xb6
	.long	0x946
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0x7
	.ascii "st_mode\0"
	.byte	0x15
	.byte	0xb6
	.long	0x953
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x7
	.ascii "st_nlink\0"
	.byte	0x15
	.byte	0xb6
	.long	0x961
	.byte	0x2
	.byte	0x23
	.byte	0x6
	.byte	0x7
	.ascii "st_ino\0"
	.byte	0x15
	.byte	0xb6
	.long	0x2eb
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x7
	.ascii "st_uid\0"
	.byte	0x15
	.byte	0xb6
	.long	0x3ac
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x7
	.ascii "st_gid\0"
	.byte	0x15
	.byte	0xb6
	.long	0x391
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x7
	.ascii "st_rdev\0"
	.byte	0x15
	.byte	0xb6
	.long	0x946
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x7
	.ascii "st_atime\0"
	.byte	0x15
	.byte	0xb6
	.long	0x97d
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x7
	.ascii "st_atimensec\0"
	.byte	0x15
	.byte	0xb6
	.long	0x18c
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x7
	.ascii "st_mtime\0"
	.byte	0x15
	.byte	0xb6
	.long	0x97d
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x7
	.ascii "st_mtimensec\0"
	.byte	0x15
	.byte	0xb6
	.long	0x18c
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x7
	.ascii "st_ctime\0"
	.byte	0x15
	.byte	0xb6
	.long	0x97d
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x7
	.ascii "st_ctimensec\0"
	.byte	0x15
	.byte	0xb6
	.long	0x18c
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x7
	.ascii "st_birthtime\0"
	.byte	0x15
	.byte	0xb6
	.long	0x97d
	.byte	0x2
	.byte	0x23
	.byte	0x50
	.byte	0x7
	.ascii "st_birthtimensec\0"
	.byte	0x15
	.byte	0xb6
	.long	0x18c
	.byte	0x2
	.byte	0x23
	.byte	0x58
	.byte	0x7
	.ascii "st_size\0"
	.byte	0x15
	.byte	0xb6
	.long	0x970
	.byte	0x2
	.byte	0x23
	.byte	0x60
	.byte	0x7
	.ascii "st_blocks\0"
	.byte	0x15
	.byte	0xb6
	.long	0x925
	.byte	0x2
	.byte	0x23
	.byte	0x68
	.byte	0x7
	.ascii "st_blksize\0"
	.byte	0x15
	.byte	0xb6
	.long	0x935
	.byte	0x2
	.byte	0x23
	.byte	0x70
	.byte	0x7
	.ascii "st_flags\0"
	.byte	0x15
	.byte	0xb6
	.long	0x11c
	.byte	0x2
	.byte	0x23
	.byte	0x74
	.byte	0x7
	.ascii "st_gen\0"
	.byte	0x15
	.byte	0xb6
	.long	0x11c
	.byte	0x2
	.byte	0x23
	.byte	0x78
	.byte	0x7
	.ascii "st_lspare\0"
	.byte	0x15
	.byte	0xb6
	.long	0x104
	.byte	0x2
	.byte	0x23
	.byte	0x7c
	.byte	0x7
	.ascii "st_qspare\0"
	.byte	0x15
	.byte	0xb6
	.long	0xb4c
	.byte	0x3
	.byte	0x23
	.byte	0x80,0x1
	.byte	0
	.byte	0x4
	.long	0x13e
	.long	0xb5c
	.byte	0x5
	.long	0x198
	.byte	0x1
	.byte	0
	.byte	0x3
	.ascii "Pipe\0"
	.byte	0x1
	.byte	0x29
	.long	0x499
	.byte	0x6
	.ascii "command\0"
	.byte	0x8
	.byte	0x1
	.byte	0xd5
	.long	0xb88
	.byte	0x7
	.ascii "argv\0"
	.byte	0x1
	.byte	0xd7
	.long	0xb88
	.byte	0x2
	.byte	0x23
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0xb8e
	.byte	0x14
	.long	0x483
	.byte	0x16
	.byte	0x1
	.ascii "__sigbits\0"
	.byte	0x16
	.byte	0x72
	.byte	0x1
	.long	0x115
	.byte	0x3
	.long	0xbbb
	.byte	0x17
	.ascii "__signo\0"
	.byte	0x16
	.byte	0x72
	.long	0x115
	.byte	0
	.byte	0x18
	.ascii "file_exist\0"
	.byte	0x1
	.word	0x15e
	.byte	0x1
	.long	0x115
	.byte	0x1
	.long	0xbf5
	.byte	0x19
	.ascii "filename\0"
	.byte	0x1
	.word	0x15e
	.long	0x483
	.byte	0x1a
	.ascii "buffer\0"
	.byte	0x1
	.word	0x160
	.long	0x98b
	.byte	0
	.byte	0x1b
	.ascii "RemoveSpaces\0"
	.byte	0x1
	.word	0x14f
	.byte	0x1
	.byte	0x1
	.long	0xc30
	.byte	0x19
	.ascii "source\0"
	.byte	0x1
	.word	0x14f
	.long	0x483
	.byte	0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x151
	.long	0x483
	.byte	0x1a
	.ascii "j\0"
	.byte	0x1
	.word	0x152
	.long	0x483
	.byte	0
	.byte	0x1c
	.ascii "err_setarg0\0"
	.byte	0x1
	.byte	0xb3
	.byte	0x1
	.byte	0x1
	.long	0xc53
	.byte	0x17
	.ascii "argv0\0"
	.byte	0x1
	.byte	0xb3
	.long	0x8a3
	.byte	0
	.byte	0x1c
	.ascii "err_syswarn\0"
	.byte	0x1
	.byte	0xc2
	.byte	0x1
	.byte	0x1
	.long	0xc80
	.byte	0x17
	.ascii "fmt\0"
	.byte	0x1
	.byte	0xc2
	.long	0x8a3
	.byte	0x1d
	.byte	0x1e
	.set L$set$141,LASF1-Lsection__debug_str
	.long L$set$141
	.byte	0x1
	.byte	0xc4
	.long	0x1d8
	.byte	0
	.byte	0x1f
	.set L$set$142,LASF2-Lsection__debug_str
	.long L$set$142
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.byte	0x1
	.long	0xcca
	.byte	0x17
	.ascii "tag\0"
	.byte	0x1
	.byte	0x70
	.long	0x8a3
	.byte	0x17
	.ascii "argc\0"
	.byte	0x1
	.byte	0x70
	.long	0x115
	.byte	0x17
	.ascii "argv\0"
	.byte	0x1
	.byte	0x70
	.long	0xcca
	.byte	0x20
	.set L$set$143,LASF3-Lsection__debug_str
	.long L$set$143
	.long	0xcd0
	.byte	0x1
	.set L$set$144,LASF2-Lsection__debug_str
	.long L$set$144
	.byte	0x21
	.byte	0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0x74
	.long	0x115
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x483
	.byte	0x14
	.long	0x489
	.byte	0x1b
	.ascii "fork_pipes\0"
	.byte	0x1
	.word	0x10d
	.byte	0x1
	.byte	0x1
	.long	0xd21
	.byte	0x19
	.ascii "n\0"
	.byte	0x1
	.word	0x10d
	.long	0x115
	.byte	0x19
	.ascii "cmd\0"
	.byte	0x1
	.word	0x10d
	.long	0xd21
	.byte	0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x10f
	.long	0x115
	.byte	0x1a
	.ascii "in\0"
	.byte	0x1
	.word	0x110
	.long	0x115
	.byte	0x1a
	.ascii "fd\0"
	.byte	0x1
	.word	0x111
	.long	0x499
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0xb68
	.byte	0x1b
	.ascii "Janitor\0"
	.byte	0x1
	.word	0x12d
	.byte	0x1
	.byte	0x1
	.long	0xd64
	.byte	0x23
	.set L$set$145,LASF4-Lsection__debug_str
	.long L$set$145
	.byte	0x1
	.word	0x12d
	.long	0x115
	.byte	0x21
	.byte	0x1a
	.ascii "a\0"
	.byte	0x1
	.word	0x131
	.long	0x115
	.byte	0x21
	.byte	0x1a
	.ascii "pid_my1\0"
	.byte	0x1
	.word	0x134
	.long	0x4a9
	.byte	0
	.byte	0
	.byte	0
	.byte	0x24
	.ascii "sighandler\0"
	.byte	0x1
	.word	0x166
	.byte	0x1
	.quad	LFB21
	.quad	LFE21
	.byte	0x2
	.byte	0x77
	.byte	0x8
	.long	0xdd1
	.byte	0x25
	.ascii "signo\0"
	.byte	0x1
	.word	0x166
	.long	0x115
	.set L$set$146,LLST0-Lsection__debug_loc
	.long L$set$146
	.byte	0x25
	.ascii "si\0"
	.byte	0x1
	.word	0x166
	.long	0x64f
	.set L$set$147,LLST1-Lsection__debug_loc
	.long L$set$147
	.byte	0x25
	.ascii "vp\0"
	.byte	0x1
	.word	0x166
	.long	0x273
	.set L$set$148,LLST2-Lsection__debug_loc
	.long L$set$148
	.byte	0x1a
	.ascii "return_value\0"
	.byte	0x1
	.word	0x168
	.long	0x115
	.byte	0
	.byte	0x26
	.ascii "StartsWith\0"
	.byte	0x1
	.byte	0xe8
	.byte	0x1
	.long	0x115
	.quad	LFB15
	.quad	LFE15
	.set L$set$149,LLST3-Lsection__debug_loc
	.long L$set$149
	.long	0xe17
	.byte	0x27
	.ascii "a\0"
	.byte	0x1
	.byte	0xe8
	.long	0x8a3
	.set L$set$150,LLST4-Lsection__debug_loc
	.long L$set$150
	.byte	0x27
	.ascii "b\0"
	.byte	0x1
	.byte	0xe8
	.long	0x8a3
	.set L$set$151,LLST5-Lsection__debug_loc
	.long L$set$151
	.byte	0
	.byte	0x28
	.ascii "err_syserr\0"
	.byte	0x1
	.byte	0xdb
	.byte	0x1
	.quad	LFB14
	.quad	LFE14
	.set L$set$152,LLST6-Lsection__debug_loc
	.long L$set$152
	.long	0xe6e
	.byte	0x27
	.ascii "fmt\0"
	.byte	0x1
	.byte	0xdb
	.long	0x483
	.set L$set$153,LLST7-Lsection__debug_loc
	.long L$set$153
	.byte	0x1d
	.byte	0x29
	.ascii "errnum\0"
	.byte	0x1
	.byte	0xdd
	.long	0x115
	.byte	0x1
	.byte	0x53
	.byte	0x2a
	.set L$set$154,LASF1-Lsection__debug_str
	.long L$set$154
	.byte	0x1
	.byte	0xde
	.long	0x1d8
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7e
	.byte	0
	.byte	0x28
	.ascii "err_vsyswarn\0"
	.byte	0x1
	.byte	0xb8
	.byte	0x1
	.quad	LFB11
	.quad	LFE11
	.set L$set$155,LLST8-Lsection__debug_loc
	.long L$set$155
	.long	0xec8
	.byte	0x27
	.ascii "fmt\0"
	.byte	0x1
	.byte	0xb8
	.long	0x8a3
	.set L$set$156,LLST9-Lsection__debug_loc
	.long L$set$156
	.byte	0x2b
	.set L$set$157,LASF1-Lsection__debug_str
	.long L$set$157
	.byte	0x1
	.byte	0xb8
	.long	0xec8
	.set L$set$158,LLST10-Lsection__debug_loc
	.long L$set$158
	.byte	0x2c
	.ascii "errnum\0"
	.byte	0x1
	.byte	0xba
	.long	0x115
	.set L$set$159,LLST11-Lsection__debug_loc
	.long L$set$159
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x200
	.byte	0x28
	.ascii "err_sysexit\0"
	.byte	0x1
	.byte	0xca
	.byte	0x1
	.quad	LFB13
	.quad	LFE13
	.set L$set$160,LLST12-Lsection__debug_loc
	.long L$set$160
	.long	0xf16
	.byte	0x27
	.ascii "fmt\0"
	.byte	0x1
	.byte	0xca
	.long	0x8a3
	.set L$set$161,LLST13-Lsection__debug_loc
	.long L$set$161
	.byte	0x1d
	.byte	0x2a
	.set L$set$162,LASF1-Lsection__debug_str
	.long L$set$162
	.byte	0x1
	.byte	0xcc
	.long	0x1d8
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7e
	.byte	0
	.byte	0x1f
	.set L$set$163,LASF5-Lsection__debug_str
	.long L$set$163
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.byte	0x1
	.long	0xf59
	.byte	0x17
	.ascii "ncmds\0"
	.byte	0x1
	.byte	0x4a
	.long	0x115
	.byte	0x17
	.ascii "cmds\0"
	.byte	0x1
	.byte	0x4a
	.long	0xf59
	.byte	0x17
	.ascii "output\0"
	.byte	0x1
	.byte	0x4a
	.long	0xf5f
	.byte	0x20
	.set L$set$164,LASF3-Lsection__debug_str
	.long L$set$164
	.long	0xf75
	.byte	0x1
	.set L$set$165,LASF5-Lsection__debug_str
	.long L$set$165
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0xcca
	.byte	0x9
	.byte	0x8
	.long	0x115
	.byte	0x4
	.long	0x1a4
	.long	0xf75
	.byte	0x5
	.long	0x198
	.byte	0x11
	.byte	0
	.byte	0x14
	.long	0xf65
	.byte	0x28
	.ascii "exec_nth_command\0"
	.byte	0x1
	.byte	0x2f
	.byte	0x1
	.quad	LFB3
	.quad	LFE3
	.set L$set$166,LLST14-Lsection__debug_loc
	.long L$set$166
	.long	0x1056
	.byte	0x27
	.ascii "ncmds\0"
	.byte	0x1
	.byte	0x2f
	.long	0x115
	.set L$set$167,LLST15-Lsection__debug_loc
	.long L$set$167
	.byte	0x27
	.ascii "cmds\0"
	.byte	0x1
	.byte	0x2f
	.long	0xf59
	.set L$set$168,LLST16-Lsection__debug_loc
	.long L$set$168
	.byte	0x2d
	.set L$set$169,LASF3-Lsection__debug_str
	.long L$set$169
	.long	0x1066
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	___func__.3142
	.byte	0x2e
	.quad	LBB20
	.quad	LBE20
	.byte	0x2c
	.ascii "pid\0"
	.byte	0x1
	.byte	0x34
	.long	0x4a9
	.set L$set$170,LLST17-Lsection__debug_loc
	.long L$set$170
	.byte	0x29
	.ascii "input\0"
	.byte	0x1
	.byte	0x35
	.long	0xb5c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x2f
	.long	0xf16
	.quad	LBB21
	.quad	LBE21
	.byte	0x30
	.long	0xf3c
	.set L$set$171,LLST18-Lsection__debug_loc
	.long L$set$171
	.byte	0x30
	.long	0xf30
	.set L$set$172,LLST19-Lsection__debug_loc
	.long L$set$172
	.byte	0x30
	.long	0xf23
	.set L$set$173,LLST20-Lsection__debug_loc
	.long L$set$173
	.byte	0x2e
	.quad	LBB22
	.quad	LBE22
	.byte	0x31
	.long	0xf4a
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.long	0x1a4
	.long	0x1066
	.byte	0x5
	.long	0x198
	.byte	0x10
	.byte	0
	.byte	0x14
	.long	0x1056
	.byte	0x32
	.long	0xd27
	.quad	LFB26
	.quad	LFE26
	.set L$set$174,LLST21-Lsection__debug_loc
	.long L$set$174
	.long	0x10c5
	.byte	0x30
	.long	0xd39
	.set L$set$175,LLST22-Lsection__debug_loc
	.long L$set$175
	.byte	0x2e
	.quad	LBB25
	.quad	LBE25
	.byte	0x33
	.long	0xd46
	.byte	0x1
	.byte	0x2e
	.quad	LBB26
	.quad	LBE26
	.byte	0x34
	.long	0xd51
	.set L$set$176,LLST23-Lsection__debug_loc
	.long L$set$176
	.byte	0
	.byte	0
	.byte	0
	.byte	0x32
	.long	0xc53
	.quad	LFB23
	.quad	LFE23
	.set L$set$177,LLST24-Lsection__debug_loc
	.long L$set$177
	.long	0x10fb
	.byte	0x30
	.long	0xc68
	.set L$set$178,LLST25-Lsection__debug_loc
	.long L$set$178
	.byte	0x1d
	.byte	0x35
	.long	0xc74
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7e
	.byte	0x36
	.long	0xc68
	.byte	0
	.byte	0x37
	.ascii "spawn_proc\0"
	.byte	0x1
	.byte	0xf0
	.byte	0x1
	.long	0x115
	.byte	0x1
	.long	0x113f
	.byte	0x17
	.ascii "in\0"
	.byte	0x1
	.byte	0xf0
	.long	0x115
	.byte	0x17
	.ascii "out\0"
	.byte	0x1
	.byte	0xf0
	.long	0x115
	.byte	0x17
	.ascii "cmd\0"
	.byte	0x1
	.byte	0xf0
	.long	0xd21
	.byte	0x22
	.ascii "pid\0"
	.byte	0x1
	.byte	0xf2
	.long	0x4a9
	.byte	0
	.byte	0x1c
	.ascii "corpse_collector\0"
	.byte	0x1
	.byte	0x62
	.byte	0x1
	.byte	0x1
	.long	0x1181
	.byte	0x22
	.ascii "parent\0"
	.byte	0x1
	.byte	0x64
	.long	0x4a9
	.byte	0x22
	.ascii "corpse\0"
	.byte	0x1
	.byte	0x65
	.long	0x4a9
	.byte	0x1e
	.set L$set$179,LASF4-Lsection__debug_str
	.long L$set$179
	.byte	0x1
	.byte	0x66
	.long	0x115
	.byte	0
	.byte	0x1c
	.ascii "exec_arguments\0"
	.byte	0x1
	.byte	0x8a
	.byte	0x1
	.byte	0x1
	.long	0x11f9
	.byte	0x17
	.ascii "argc\0"
	.byte	0x1
	.byte	0x8a
	.long	0x115
	.byte	0x17
	.ascii "argv\0"
	.byte	0x1
	.byte	0x8a
	.long	0xcca
	.byte	0x22
	.ascii "cmdv\0"
	.byte	0x1
	.byte	0x90
	.long	0xf59
	.byte	0x1e
	.set L$set$180,LASF1-Lsection__debug_str
	.long L$set$180
	.byte	0x1
	.byte	0x91
	.long	0xcca
	.byte	0x22
	.ascii "cmdn\0"
	.byte	0x1
	.byte	0x92
	.long	0x115
	.byte	0x22
	.ascii "argn\0"
	.byte	0x1
	.byte	0x93
	.long	0x115
	.byte	0x21
	.byte	0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0x97
	.long	0x115
	.byte	0x21
	.byte	0x22
	.ascii "arg\0"
	.byte	0x1
	.byte	0x99
	.long	0x483
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1f
	.set L$set$181,LASF6-Lsection__debug_str
	.long L$set$181
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x1
	.long	0x1239
	.byte	0x17
	.ascii "ncmds\0"
	.byte	0x1
	.byte	0x55
	.long	0x115
	.byte	0x17
	.ascii "cmds\0"
	.byte	0x1
	.byte	0x55
	.long	0xf59
	.byte	0x22
	.ascii "pid\0"
	.byte	0x1
	.byte	0x57
	.long	0x4a9
	.byte	0x20
	.set L$set$182,LASF3-Lsection__debug_str
	.long L$set$182
	.long	0x1249
	.byte	0x1
	.set L$set$183,LASF6-Lsection__debug_str
	.long L$set$183
	.byte	0
	.byte	0x4
	.long	0x1a4
	.long	0x1249
	.byte	0x5
	.long	0x198
	.byte	0xd
	.byte	0
	.byte	0x14
	.long	0x1239
	.byte	0x1c
	.ascii "dump_pipeline\0"
	.byte	0x1
	.byte	0x7b
	.byte	0x1
	.byte	0x1
	.long	0x1296
	.byte	0x17
	.ascii "cmdn\0"
	.byte	0x1
	.byte	0x7b
	.long	0x115
	.byte	0x17
	.ascii "cmdv\0"
	.byte	0x1
	.byte	0x7b
	.long	0xf59
	.byte	0x21
	.byte	0x22
	.ascii "i\0"
	.byte	0x1
	.byte	0x7e
	.long	0x115
	.byte	0x21
	.byte	0x1e
	.set L$set$184,LASF1-Lsection__debug_str
	.long L$set$184
	.byte	0x1
	.byte	0x81
	.long	0xcca
	.byte	0
	.byte	0
	.byte	0
	.byte	0x38
	.byte	0x1
	.ascii "main\0"
	.byte	0x1
	.word	0x16d
	.byte	0x1
	.long	0x115
	.quad	LFB22
	.quad	LFE22
	.set L$set$185,LLST26-Lsection__debug_loc
	.long L$set$185
	.long	0x191a
	.byte	0x25
	.ascii "argc\0"
	.byte	0x1
	.word	0x16d
	.long	0x115
	.set L$set$186,LLST27-Lsection__debug_loc
	.long L$set$186
	.byte	0x25
	.ascii "argv\0"
	.byte	0x1
	.word	0x16d
	.long	0xcca
	.set L$set$187,LLST28-Lsection__debug_loc
	.long L$set$187
	.byte	0x39
	.ascii "p\0"
	.byte	0x1
	.word	0x16f
	.long	0x483
	.set L$set$188,LLST29-Lsection__debug_loc
	.long L$set$188
	.byte	0x3a
	.ascii "array\0"
	.byte	0x1
	.word	0x170
	.long	0x191a
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x6e
	.byte	0x3a
	.ascii "line\0"
	.byte	0x1
	.word	0x171
	.long	0x192a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x6f
	.byte	0x3a
	.ascii "line2\0"
	.byte	0x1
	.word	0x172
	.long	0x192a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x77
	.byte	0x1a
	.ascii "argv2\0"
	.byte	0x1
	.word	0x173
	.long	0x193b
	.byte	0x3b
	.ascii "argc2\0"
	.byte	0x1
	.word	0x174
	.long	0x115
	.byte	0
	.byte	0x39
	.ascii "length\0"
	.byte	0x1
	.word	0x175
	.long	0x39e
	.set L$set$189,LLST30-Lsection__debug_loc
	.long L$set$189
	.byte	0x39
	.ascii "token3\0"
	.byte	0x1
	.word	0x176
	.long	0x483
	.set L$set$190,LLST31-Lsection__debug_loc
	.long L$set$190
	.byte	0x39
	.ascii "i\0"
	.byte	0x1
	.word	0x177
	.long	0x115
	.set L$set$191,LLST32-Lsection__debug_loc
	.long L$set$191
	.byte	0x39
	.ascii "tokenstr\0"
	.byte	0x1
	.word	0x178
	.long	0x483
	.set L$set$192,LLST33-Lsection__debug_loc
	.long L$set$192
	.byte	0x1a
	.ascii "search\0"
	.byte	0x1
	.word	0x179
	.long	0x483
	.byte	0x39
	.ascii "isBackground\0"
	.byte	0x1
	.word	0x17a
	.long	0x115
	.set L$set$193,LLST34-Lsection__debug_loc
	.long L$set$193
	.byte	0x1a
	.ascii "built_in_command\0"
	.byte	0x1
	.word	0x17b
	.long	0x115
	.byte	0x3a
	.ascii "fd\0"
	.byte	0x1
	.word	0x17c
	.long	0x499
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x6d
	.byte	0x3a
	.ascii "printenv\0"
	.byte	0x1
	.word	0x17d
	.long	0x194b
	.byte	0x3
	.byte	0x91
	.byte	0xf0,0x6d
	.byte	0x3a
	.ascii "sort\0"
	.byte	0x1
	.word	0x17e
	.long	0x194b
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x6e
	.byte	0x3a
	.ascii "pager_cmd\0"
	.byte	0x1
	.word	0x17f
	.long	0x194b
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x6e
	.byte	0x3a
	.ascii "grep\0"
	.byte	0x1
	.word	0x180
	.long	0x191a
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x6f
	.byte	0x39
	.ascii "time\0"
	.byte	0x1
	.word	0x181
	.long	0x18c
	.set L$set$194,LLST35-Lsection__debug_loc
	.long L$set$194
	.byte	0x3c
	.set L$set$195,LASF4-Lsection__debug_str
	.long L$set$195
	.byte	0x1
	.word	0x182
	.long	0x115
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x6d
	.byte	0x3b
	.ascii "max\0"
	.byte	0x1
	.word	0x183
	.long	0x115
	.byte	0x50
	.byte	0x1a
	.ascii "b\0"
	.byte	0x1
	.word	0x184
	.long	0x115
	.byte	0x3b
	.ascii "pos\0"
	.byte	0x1
	.word	0x185
	.long	0x115
	.byte	0
	.byte	0x39
	.ascii "tmp\0"
	.byte	0x1
	.word	0x186
	.long	0x483
	.set L$set$196,LLST36-Lsection__debug_loc
	.long L$set$196
	.byte	0x39
	.ascii "new_str\0"
	.byte	0x1
	.word	0x187
	.long	0x483
	.set L$set$197,LLST37-Lsection__debug_loc
	.long L$set$197
	.byte	0x3b
	.ascii "len\0"
	.byte	0x1
	.word	0x188
	.long	0x115
	.byte	0x1
	.byte	0x1a
	.ascii "k\0"
	.byte	0x1
	.word	0x189
	.long	0x115
	.byte	0x39
	.ascii "pw\0"
	.byte	0x1
	.word	0x18a
	.long	0x195b
	.set L$set$198,LLST38-Lsection__debug_loc
	.long L$set$198
	.byte	0x39
	.ascii "homedir\0"
	.byte	0x1
	.word	0x18b
	.long	0x8a3
	.set L$set$199,LLST39-Lsection__debug_loc
	.long L$set$199
	.byte	0x1a
	.ascii "cmd\0"
	.byte	0x1
	.word	0x18c
	.long	0x1961
	.byte	0x3a
	.ascii "cmd2\0"
	.byte	0x1
	.word	0x18d
	.long	0x1971
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x6f
	.byte	0x3a
	.ascii "time_start\0"
	.byte	0x1
	.word	0x18e
	.long	0x8f1
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x6e
	.byte	0x3a
	.ascii "time_end\0"
	.byte	0x1
	.word	0x18f
	.long	0x8f1
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x6e
	.byte	0x3a
	.ascii "my_sig\0"
	.byte	0x1
	.word	0x190
	.long	0x4b6
	.byte	0x3
	.byte	0x91
	.byte	0xcc,0x6d
	.byte	0x39
	.ascii "pid_temp\0"
	.byte	0x1
	.word	0x191
	.long	0x4a9
	.set L$set$200,LLST40-Lsection__debug_loc
	.long L$set$200
	.byte	0x39
	.ascii "pagerValue\0"
	.byte	0x1
	.word	0x192
	.long	0x483
	.set L$set$201,LLST41-Lsection__debug_loc
	.long L$set$201
	.byte	0x39
	.ascii "ret\0"
	.byte	0x1
	.word	0x193
	.long	0x115
	.set L$set$202,LLST42-Lsection__debug_loc
	.long L$set$202
	.byte	0x39
	.ascii "pathValue\0"
	.byte	0x1
	.word	0x194
	.long	0x483
	.set L$set$203,LLST43-Lsection__debug_loc
	.long L$set$203
	.byte	0x39
	.ascii "pathValue2\0"
	.byte	0x1
	.word	0x195
	.long	0x483
	.set L$set$204,LLST44-Lsection__debug_loc
	.long L$set$204
	.byte	0x1a
	.ascii "breakloop\0"
	.byte	0x1
	.word	0x196
	.long	0x115
	.byte	0x3a
	.ascii "sa\0"
	.byte	0x1
	.word	0x197
	.long	0x655
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x6e
	.byte	0x3a
	.ascii "osa\0"
	.byte	0x1
	.word	0x197
	.long	0x655
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x6e
	.byte	0x3d
	.long	0xbbb
	.quad	LBB53
	.quad	LBE53
	.long	0x15fc
	.byte	0x30
	.long	0xbd4
	.set L$set$205,LLST45-Lsection__debug_loc
	.long L$set$205
	.byte	0x2e
	.quad	LBB54
	.quad	LBE54
	.byte	0x35
	.long	0xbe5
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x77
	.byte	0
	.byte	0
	.byte	0x3d
	.long	0xbf5
	.quad	LBB59
	.quad	LBE59
	.long	0x1643
	.byte	0x30
	.long	0xc0c
	.set L$set$206,LLST46-Lsection__debug_loc
	.long L$set$206
	.byte	0x2e
	.quad	LBB60
	.quad	LBE60
	.byte	0x34
	.long	0xc1b
	.set L$set$207,LLST47-Lsection__debug_loc
	.long L$set$207
	.byte	0x34
	.long	0xc25
	.set L$set$208,LLST48-Lsection__debug_loc
	.long L$set$208
	.byte	0
	.byte	0
	.byte	0x3d
	.long	0xc30
	.quad	LBB61
	.quad	LBE61
	.long	0x1666
	.byte	0x30
	.long	0xc45
	.set L$set$209,LLST49-Lsection__debug_loc
	.long L$set$209
	.byte	0
	.byte	0x3d
	.long	0x1181
	.quad	LBB65
	.quad	LBE65
	.long	0x1819
	.byte	0x30
	.long	0x11a5
	.set L$set$210,LLST50-Lsection__debug_loc
	.long L$set$210
	.byte	0x30
	.long	0x1199
	.set L$set$211,LLST51-Lsection__debug_loc
	.long L$set$211
	.byte	0x2e
	.quad	LBB66
	.quad	LBE66
	.byte	0x34
	.long	0x11b1
	.set L$set$212,LLST52-Lsection__debug_loc
	.long L$set$212
	.byte	0x34
	.long	0x11bd
	.set L$set$213,LLST53-Lsection__debug_loc
	.long L$set$213
	.byte	0x34
	.long	0x11c8
	.set L$set$214,LLST54-Lsection__debug_loc
	.long L$set$214
	.byte	0x34
	.long	0x11d4
	.set L$set$215,LLST55-Lsection__debug_loc
	.long L$set$215
	.byte	0x3d
	.long	0xc80
	.quad	LBB67
	.quad	LBE67
	.long	0x1733
	.byte	0x36
	.long	0xc8d
	.byte	0x30
	.long	0xca4
	.set L$set$216,LLST50-Lsection__debug_loc
	.long L$set$216
	.byte	0x30
	.long	0xc98
	.set L$set$217,LLST51-Lsection__debug_loc
	.long L$set$217
	.byte	0x2e
	.quad	LBB68
	.quad	LBE68
	.byte	0x35
	.long	0xcb0
	.byte	0x9
	.byte	0x3
	.quad	___func__.3171
	.byte	0x2e
	.quad	LBB69
	.quad	LBE69
	.byte	0x34
	.long	0xcbf
	.set L$set$218,LLST58-Lsection__debug_loc
	.long L$set$218
	.byte	0
	.byte	0
	.byte	0
	.byte	0x3e
	.quad	LBB75
	.quad	LBE75
	.long	0x176d
	.byte	0x34
	.long	0x11e1
	.set L$set$219,LLST59-Lsection__debug_loc
	.long L$set$219
	.byte	0x2e
	.quad	LBB76
	.quad	LBE76
	.byte	0x34
	.long	0x11eb
	.set L$set$220,LLST60-Lsection__debug_loc
	.long L$set$220
	.byte	0
	.byte	0
	.byte	0x3d
	.long	0x124e
	.quad	LBB81
	.quad	LBE81
	.long	0x17cf
	.byte	0x30
	.long	0x1271
	.set L$set$221,LLST61-Lsection__debug_loc
	.long L$set$221
	.byte	0x30
	.long	0x1265
	.set L$set$222,LLST62-Lsection__debug_loc
	.long L$set$222
	.byte	0x2e
	.quad	LBB83
	.quad	LBE83
	.byte	0x34
	.long	0x127e
	.set L$set$223,LLST63-Lsection__debug_loc
	.long L$set$223
	.byte	0x2e
	.quad	LBB84
	.quad	LBE84
	.byte	0x34
	.long	0x1288
	.set L$set$224,LLST64-Lsection__debug_loc
	.long L$set$224
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2f
	.long	0x11f9
	.quad	LBB85
	.quad	LBE85
	.byte	0x30
	.long	0x1213
	.set L$set$225,LLST65-Lsection__debug_loc
	.long L$set$225
	.byte	0x30
	.long	0x1206
	.set L$set$226,LLST66-Lsection__debug_loc
	.long L$set$226
	.byte	0x2e
	.quad	LBB86
	.quad	LBE86
	.byte	0x34
	.long	0x121f
	.set L$set$227,LLST67-Lsection__debug_loc
	.long L$set$227
	.byte	0x31
	.long	0x122a
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x3d
	.long	0x113f
	.quad	LBB105
	.quad	LBE105
	.long	0x1860
	.byte	0x2e
	.quad	LBB106
	.quad	LBE106
	.byte	0x34
	.long	0x1159
	.set L$set$228,LLST68-Lsection__debug_loc
	.long L$set$228
	.byte	0x34
	.long	0x1167
	.set L$set$229,LLST69-Lsection__debug_loc
	.long L$set$229
	.byte	0x35
	.long	0x1175
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x6f
	.byte	0
	.byte	0
	.byte	0x3e
	.quad	LBB107
	.quad	LBE107
	.long	0x1880
	.byte	0x1a
	.ascii "a\0"
	.byte	0x1
	.word	0x296
	.long	0x115
	.byte	0
	.byte	0x2f
	.long	0xcd5
	.quad	LBB109
	.quad	LBE109
	.byte	0x36
	.long	0xcea
	.byte	0x30
	.long	0xcf4
	.set L$set$230,LLST70-Lsection__debug_loc
	.long L$set$230
	.byte	0x2e
	.quad	LBB110
	.quad	LBE110
	.byte	0x34
	.long	0xd00
	.set L$set$231,LLST71-Lsection__debug_loc
	.long L$set$231
	.byte	0x34
	.long	0xd0a
	.set L$set$232,LLST72-Lsection__debug_loc
	.long L$set$232
	.byte	0x35
	.long	0xd15
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x6d
	.byte	0x2f
	.long	0x10fb
	.quad	LBB111
	.quad	LBE111
	.byte	0x36
	.long	0x1128
	.byte	0x30
	.long	0x111d
	.set L$set$233,LLST73-Lsection__debug_loc
	.long L$set$233
	.byte	0x30
	.long	0x1113
	.set L$set$234,LLST74-Lsection__debug_loc
	.long L$set$234
	.byte	0x2e
	.quad	LBB112
	.quad	LBE112
	.byte	0x34
	.long	0x1133
	.set L$set$235,LLST75-Lsection__debug_loc
	.long L$set$235
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.long	0x483
	.long	0x192a
	.byte	0x5
	.long	0x198
	.byte	0x3
	.byte	0
	.byte	0x4
	.long	0x1a4
	.long	0x193b
	.byte	0x3f
	.long	0x198
	.word	0x3ff
	.byte	0
	.byte	0x4
	.long	0x483
	.long	0x194b
	.byte	0x5
	.long	0x198
	.byte	0x63
	.byte	0
	.byte	0x4
	.long	0x483
	.long	0x195b
	.byte	0x5
	.long	0x198
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x8
	.long	0x3b9
	.byte	0x4
	.long	0xb68
	.long	0x1971
	.byte	0x5
	.long	0x198
	.byte	0x2
	.byte	0
	.byte	0x4
	.long	0xb68
	.long	0x1981
	.byte	0x5
	.long	0x198
	.byte	0x3
	.byte	0
	.byte	0x29
	.ascii "arg0\0"
	.byte	0x1
	.byte	0xb1
	.long	0x8a3
	.byte	0x9
	.byte	0x3
	.quad	_arg0
	.byte	0x40
	.ascii "__stdinp\0"
	.byte	0xc
	.byte	0x9c
	.long	0x19a9
	.byte	0x1
	.byte	0x1
	.byte	0x9
	.byte	0x8
	.long	0x8e5
	.byte	0x40
	.ascii "__stdoutp\0"
	.byte	0xc
	.byte	0x9d
	.long	0x19a9
	.byte	0x1
	.byte	0x1
	.byte	0x40
	.ascii "__stderrp\0"
	.byte	0xc
	.byte	0x9e
	.long	0x19a9
	.byte	0x1
	.byte	0x1
	.byte	0x41
	.ascii "isSignal\0"
	.byte	0x1
	.byte	0x1b
	.long	0x115
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	_isSignal
	.byte	0x41
	.ascii "foreground\0"
	.byte	0x1
	.byte	0xd3
	.long	0x4a9
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	_foreground
	.byte	0
	.section __DWARF,__debug_abbrev,regular,debug
Lsection__debug_abbrev:
Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x1b
	.byte	0x8
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0xb4,0x42
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x17
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x17
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x27
	.byte	0xc
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0xc
	.byte	0x1c
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0xa
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x2b
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x2d
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0xc
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x2f
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x30
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x31
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x32
	.byte	0x2e
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x33
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x34
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x35
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x36
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x37
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x38
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x39
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x3a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x3b
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x3c
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0x3d
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3e
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3f
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x40
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0
	.byte	0
	.byte	0x41
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x2
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0
	.section __DWARF,__debug_loc,regular,debug
Lsection__debug_loc:
Ldebug_loc0:
LLST0:
	.quad	LVL0
	.quad	LVL2
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
LLST1:
	.quad	LVL0
	.quad	LVL3
	.word	0x1
	.byte	0x54
	.quad	0
	.quad	0
LLST2:
	.quad	LVL0
	.quad	LVL1
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
LLST3:
	.quad	LFB15
	.quad	LCFI0
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI0
	.quad	LCFI1
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI1
	.quad	LCFI2
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI2
	.quad	LCFI3
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI3
	.quad	LCFI4
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI4
	.quad	LCFI5
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI5
	.quad	LFE15
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST4:
	.quad	LVL5
	.quad	LVL6
	.word	0x1
	.byte	0x55
	.quad	LVL6
	.quad	LVL10
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST5:
	.quad	LVL5
	.quad	LVL7-1
	.word	0x1
	.byte	0x54
	.quad	LVL7-1
	.quad	LVL9
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
LLST6:
	.quad	LFB14
	.quad	LCFI6
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI6
	.quad	LCFI7
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI7
	.quad	LCFI8
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI8
	.quad	LCFI9
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI9
	.quad	LFE14
	.word	0x3
	.byte	0x77
	.byte	0xf0,0x1
	.quad	0
	.quad	0
LLST7:
	.quad	LVL11
	.quad	LVL12-1
	.word	0x1
	.byte	0x55
	.quad	LVL12-1
	.quad	LFE14
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
LLST8:
	.quad	LFB11
	.quad	LCFI10
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI10
	.quad	LCFI11
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI11
	.quad	LCFI12
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI12
	.quad	LCFI13
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI13
	.quad	LCFI14
	.word	0x2
	.byte	0x77
	.byte	0x28
	.quad	LCFI14
	.quad	LCFI15
	.word	0x2
	.byte	0x77
	.byte	0x30
	.quad	LCFI15
	.quad	LCFI16
	.word	0x2
	.byte	0x77
	.byte	0x28
	.quad	LCFI16
	.quad	LCFI17
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI17
	.quad	LCFI18
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI18
	.quad	LCFI19
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI19
	.quad	LFE11
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST9:
	.quad	LVL18
	.quad	LVL19-1
	.word	0x1
	.byte	0x55
	.quad	LVL19-1
	.quad	LVL27
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
LLST10:
	.quad	LVL18
	.quad	LVL19-1
	.word	0x1
	.byte	0x54
	.quad	LVL19-1
	.quad	LVL28
	.word	0x1
	.byte	0x5d
	.quad	0
	.quad	0
LLST11:
	.quad	LVL20
	.quad	LVL26
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST12:
	.quad	LFB13
	.quad	LCFI20
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI20
	.quad	LFE13
	.word	0x3
	.byte	0x77
	.byte	0xe0,0x1
	.quad	0
	.quad	0
LLST13:
	.quad	LVL30
	.quad	LVL31-1
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
LLST14:
	.quad	LFB3
	.quad	LCFI21
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI21
	.quad	LCFI22
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI22
	.quad	LCFI23
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI23
	.quad	LFE3
	.word	0x2
	.byte	0x77
	.byte	0x30
	.quad	0
	.quad	0
LLST15:
	.quad	LVL33
	.quad	LVL34
	.word	0x1
	.byte	0x55
	.quad	LVL34
	.quad	LVL40
	.word	0x1
	.byte	0x53
	.quad	LVL43
	.quad	LVL45
	.word	0x1
	.byte	0x55
	.quad	LVL45
	.quad	LFE3
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
LLST16:
	.quad	LVL33
	.quad	LVL35-1
	.word	0x1
	.byte	0x54
	.quad	LVL35-1
	.quad	LVL43
	.word	0x1
	.byte	0x56
	.quad	LVL43
	.quad	LVL44
	.word	0x1
	.byte	0x54
	.quad	LVL46
	.quad	LFE3
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST17:
	.quad	LVL36
	.quad	LVL37-1
	.word	0x1
	.byte	0x50
	.quad	LVL46
	.quad	LVL47-1
	.word	0x1
	.byte	0x50
	.quad	LVL51
	.quad	LVL52
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST18:
	.quad	LVL46
	.quad	LVL51
	.word	0x1
	.byte	0x57
	.quad	0
	.quad	0
LLST19:
	.quad	LVL46
	.quad	LVL51
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST20:
	.quad	LVL50
	.quad	LVL51-1
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
LLST21:
	.quad	LFB26
	.quad	LCFI24
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI24
	.quad	LCFI25
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI25
	.quad	LCFI26
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI26
	.quad	LCFI27
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI27
	.quad	LFE26
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST22:
	.quad	LVL54
	.quad	LVL55
	.word	0x2
	.byte	0x91
	.byte	0x6c
	.quad	LVL55
	.quad	LVL60
	.word	0x2
	.byte	0x73
	.byte	0
	.quad	LVL60
	.quad	LFE26
	.word	0x2
	.byte	0x91
	.byte	0x6c
	.quad	0
	.quad	0
LLST23:
	.quad	LVL56
	.quad	LVL57
	.word	0x1
	.byte	0x50
	.quad	LVL57
	.quad	LVL58-1
	.word	0x1
	.byte	0x54
	.quad	LVL59
	.quad	LFE26
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST24:
	.quad	LFB23
	.quad	LCFI28
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI28
	.quad	LCFI29
	.word	0x3
	.byte	0x77
	.byte	0xe0,0x1
	.quad	LCFI29
	.quad	LFE23
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	0
	.quad	0
LLST25:
	.quad	LVL61
	.quad	LVL63
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
LLST26:
	.quad	LFB22
	.quad	LCFI30
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI30
	.quad	LCFI31
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI31
	.quad	LCFI32
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI32
	.quad	LCFI33
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI33
	.quad	LCFI34
	.word	0x2
	.byte	0x77
	.byte	0x28
	.quad	LCFI34
	.quad	LCFI35
	.word	0x2
	.byte	0x77
	.byte	0x30
	.quad	LCFI35
	.quad	LCFI36
	.word	0x2
	.byte	0x77
	.byte	0x38
	.quad	LCFI36
	.quad	LCFI37
	.word	0x3
	.byte	0x77
	.byte	0x80,0x13
	.quad	LCFI37
	.quad	LCFI38
	.word	0x2
	.byte	0x77
	.byte	0x38
	.quad	LCFI38
	.quad	LCFI39
	.word	0x2
	.byte	0x77
	.byte	0x30
	.quad	LCFI39
	.quad	LCFI40
	.word	0x2
	.byte	0x77
	.byte	0x28
	.quad	LCFI40
	.quad	LCFI41
	.word	0x2
	.byte	0x77
	.byte	0x20
	.quad	LCFI41
	.quad	LCFI42
	.word	0x2
	.byte	0x77
	.byte	0x18
	.quad	LCFI42
	.quad	LCFI43
	.word	0x2
	.byte	0x77
	.byte	0x10
	.quad	LCFI43
	.quad	LCFI44
	.word	0x2
	.byte	0x77
	.byte	0x8
	.quad	LCFI44
	.quad	LFE22
	.word	0x3
	.byte	0x77
	.byte	0x80,0x13
	.quad	0
	.quad	0
LLST27:
	.quad	LVL65
	.quad	LVL66
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
LLST28:
	.quad	LVL65
	.quad	LVL67
	.word	0x1
	.byte	0x54
	.quad	LVL67
	.quad	LFE22
	.word	0x3
	.byte	0x91
	.byte	0x88,0x6d
	.quad	0
	.quad	0
LLST29:
	.quad	LVL129
	.quad	LVL132-1
	.word	0x1
	.byte	0x50
	.quad	LVL132
	.quad	LVL134
	.word	0x1
	.byte	0x50
	.quad	LVL154
	.quad	LVL155
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST30:
	.quad	LVL105
	.quad	LVL106
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
LLST31:
	.quad	LVL77
	.quad	LVL78
	.word	0x1
	.byte	0x50
	.quad	LVL78
	.quad	LVL81
	.word	0x1
	.byte	0x53
	.quad	LVL81
	.quad	LVL83-1
	.word	0x1
	.byte	0x50
	.quad	LVL83-1
	.quad	LVL92
	.word	0x1
	.byte	0x53
	.quad	LVL117
	.quad	LVL119
	.word	0x1
	.byte	0x53
	.quad	LVL120
	.quad	LVL121
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST32:
	.quad	LVL130
	.quad	LVL133
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST33:
	.quad	LVL111
	.quad	LVL112-1
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST34:
	.quad	LVL123
	.quad	LVL155
	.word	0x1
	.byte	0x5f
	.quad	LVL163
	.quad	LVL167
	.word	0x1
	.byte	0x5f
	.quad	LVL169
	.quad	LVL197
	.word	0x1
	.byte	0x5f
	.quad	LVL205
	.quad	LVL206
	.word	0x1
	.byte	0x5f
	.quad	LVL209
	.quad	LVL215
	.word	0x1
	.byte	0x5f
	.quad	LVL252
	.quad	LVL253
	.word	0x1
	.byte	0x5f
	.quad	LVL257
	.quad	LVL261
	.word	0x1
	.byte	0x5f
	.quad	LVL262
	.quad	LFE22
	.word	0x1
	.byte	0x5f
	.quad	0
	.quad	0
LLST35:
	.quad	LVL200
	.quad	LVL201
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST36:
	.quad	LVL218
	.quad	LVL219
	.word	0x1
	.byte	0x50
	.quad	LVL219
	.quad	LVL220
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6f
	.quad	0
	.quad	0
LLST37:
	.quad	LVL78
	.quad	LVL79-1
	.word	0x1
	.byte	0x50
	.quad	LVL79-1
	.quad	LVL82
	.word	0x1
	.byte	0x5d
	.quad	LVL85
	.quad	LVL86-1
	.word	0x1
	.byte	0x50
	.quad	LVL86-1
	.quad	LVL91
	.word	0x1
	.byte	0x5d
	.quad	LVL117
	.quad	LVL119
	.word	0x1
	.byte	0x5d
	.quad	0
	.quad	0
LLST38:
	.quad	LVL160
	.quad	LVL161-1
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST39:
	.quad	LVL160
	.quad	LVL161-1
	.word	0x2
	.byte	0x70
	.byte	0x30
	.quad	0
	.quad	0
LLST40:
	.quad	LVL94
	.quad	LVL117
	.word	0x3
	.byte	0x91
	.byte	0x98,0x6d
	.quad	LVL119
	.quad	LVL120
	.word	0x3
	.byte	0x91
	.byte	0x98,0x6d
	.quad	LVL121
	.quad	LVL155
	.word	0x3
	.byte	0x91
	.byte	0x98,0x6d
	.quad	LVL158
	.quad	LVL166
	.word	0x3
	.byte	0x91
	.byte	0x98,0x6d
	.quad	LVL166
	.quad	LVL167
	.word	0x1
	.byte	0x50
	.quad	LVL167
	.quad	LFE22
	.word	0x3
	.byte	0x91
	.byte	0x98,0x6d
	.quad	0
	.quad	0
LLST41:
	.quad	LVL216
	.quad	LVL217
	.word	0x1
	.byte	0x50
	.quad	LVL250
	.quad	LVL251
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST42:
	.quad	LVL91
	.quad	LVL117
	.word	0x3
	.byte	0x91
	.byte	0x84,0x6d
	.quad	LVL119
	.quad	LVL120
	.word	0x3
	.byte	0x91
	.byte	0x84,0x6d
	.quad	LVL121
	.quad	LVL155
	.word	0x3
	.byte	0x91
	.byte	0x84,0x6d
	.quad	LVL158
	.quad	LFE22
	.word	0x3
	.byte	0x91
	.byte	0x84,0x6d
	.quad	0
	.quad	0
LLST43:
	.quad	LVL71
	.quad	LVL72
	.word	0x1
	.byte	0x50
	.quad	LVL72
	.quad	LVL73-1
	.word	0x1
	.byte	0x51
	.quad	LVL73-1
	.quad	LVL77
	.word	0x1
	.byte	0x53
	.quad	LVL155
	.quad	LVL156
	.word	0x1
	.byte	0x50
	.quad	LVL156
	.quad	LVL158
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
LLST44:
	.quad	LVL75
	.quad	LVL76-1
	.word	0x1
	.byte	0x50
	.quad	LVL76-1
	.quad	LVL94
	.word	0x1
	.byte	0x56
	.quad	LVL117
	.quad	LVL119
	.word	0x1
	.byte	0x56
	.quad	LVL120
	.quad	LVL121
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST45:
	.quad	LVL87
	.quad	LVL88-1
	.word	0x1
	.byte	0x55
	.quad	LVL88-1
	.quad	LVL91
	.word	0x1
	.byte	0x5d
	.quad	LVL117
	.quad	LVL119
	.word	0x1
	.byte	0x5d
	.quad	0
	.quad	0
LLST46:
	.quad	LVL100
	.quad	LVL117
	.word	0x1
	.byte	0x5c
	.quad	LVL121
	.quad	LVL155
	.word	0x1
	.byte	0x5c
	.quad	LVL158
	.quad	LVL220
	.word	0x1
	.byte	0x5c
	.quad	LVL250
	.quad	LVL261
	.word	0x1
	.byte	0x5c
	.quad	LVL262
	.quad	LFE22
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
LLST47:
	.quad	LVL100
	.quad	LVL101
	.word	0x1
	.byte	0x5c
	.quad	LVL101
	.quad	LVL104-1
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
LLST48:
	.quad	LVL100
	.quad	LVL101
	.word	0x1
	.byte	0x5c
	.quad	LVL101
	.quad	LVL104-1
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
LLST49:
	.quad	LVL127
	.quad	LVL129-1
	.word	0x4
	.byte	0x91
	.byte	0x88,0x6d
	.byte	0x6
	.quad	0
	.quad	0
LLST50:
	.quad	LVL135
	.quad	LVL147
	.word	0x1
	.byte	0x5d
	.quad	LVL169
	.quad	LVL170
	.word	0x1
	.byte	0x5d
	.quad	LVL172
	.quad	LVL173
	.word	0x1
	.byte	0x5d
	.quad	0
	.quad	0
LLST51:
	.quad	LVL135
	.quad	LVL136-1
	.word	0x1
	.byte	0x51
	.quad	LVL136-1
	.quad	LVL154
	.word	0x1
	.byte	0x56
	.quad	LVL169
	.quad	LVL170
	.word	0x1
	.byte	0x56
	.quad	LVL172
	.quad	LVL175
	.word	0x1
	.byte	0x56
	.quad	LVL214
	.quad	LVL215
	.word	0x1
	.byte	0x56
	.quad	LVL257
	.quad	LVL261
	.word	0x1
	.byte	0x56
	.quad	LVL262
	.quad	LFE22
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST52:
	.quad	LVL141
	.quad	LVL142
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	0
	.quad	0
LLST53:
	.quad	LVL144
	.quad	LVL145
	.word	0x1
	.byte	0x50
	.quad	LVL145
	.quad	LVL154
	.word	0x1
	.byte	0x5e
	.quad	LVL172
	.quad	LVL209
	.word	0x1
	.byte	0x5e
	.quad	LVL211
	.quad	LVL215
	.word	0x1
	.byte	0x5e
	.quad	LVL252
	.quad	LVL261
	.word	0x1
	.byte	0x5e
	.quad	LVL262
	.quad	LFE22
	.word	0x1
	.byte	0x5e
	.quad	0
	.quad	0
LLST54:
	.quad	LVL147
	.quad	LVL154
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	LVL257
	.quad	LVL259
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	LVL260
	.quad	LVL261
	.word	0x1
	.byte	0x50
	.quad	LVL262
	.quad	LFE22
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	0
	.quad	0
LLST55:
	.quad	LVL150
	.quad	LVL153
	.word	0x1
	.byte	0x51
	.quad	LVL258
	.quad	LVL261
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
LLST58:
	.quad	LVL136
	.quad	LVL137
	.word	0x1
	.byte	0x5e
	.quad	0
	.quad	0
LLST59:
	.quad	LVL147
	.quad	LVL150-1
	.word	0x1
	.byte	0x51
	.quad	LVL150
	.quad	LVL152
	.word	0x1
	.byte	0x51
	.quad	LVL152
	.quad	LVL154
	.word	0x1
	.byte	0x50
	.quad	LVL257
	.quad	LVL261
	.word	0x1
	.byte	0x51
	.quad	LVL262
	.quad	LVL263-1
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
LLST60:
	.quad	LVL148
	.quad	LVL149
	.word	0x1
	.byte	0x50
	.quad	LVL150
	.quad	LVL151
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST61:
	.quad	LVL174
	.quad	LVL209
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	LVL211
	.quad	LVL214
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	LVL252
	.quad	LVL257
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	0
	.quad	0
LLST62:
	.quad	LVL174
	.quad	LVL209
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	LVL211
	.quad	LVL214
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	LVL252
	.quad	LVL257
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	0
	.quad	0
LLST63:
	.quad	LVL177
	.quad	LVL182
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST64:
	.quad	LVL179
	.quad	LVL184
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
LLST65:
	.quad	LVL186
	.quad	LVL209
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	LVL211
	.quad	LVL214
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	LVL252
	.quad	LVL257
	.word	0x3
	.byte	0x91
	.byte	0x90,0x6d
	.quad	0
	.quad	0
LLST66:
	.quad	LVL186
	.quad	LVL209
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	LVL211
	.quad	LVL214
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	LVL252
	.quad	LVL257
	.word	0x3
	.byte	0x91
	.byte	0x9c,0x6d
	.quad	0
	.quad	0
LLST67:
	.quad	LVL187
	.quad	LVL188
	.word	0x1
	.byte	0x50
	.quad	LVL211
	.quad	LVL212
	.word	0x1
	.byte	0x50
	.quad	LVL252
	.quad	LVL253-1
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST68:
	.quad	LVL192
	.quad	LVL193
	.word	0x1
	.byte	0x50
	.quad	LVL193
	.quad	LVL209
	.word	0x1
	.byte	0x56
	.quad	LVL253
	.quad	LVL257
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST69:
	.quad	LVL193
	.quad	LVL194
	.word	0x1
	.byte	0x50
	.quad	LVL194
	.quad	LVL195-1
	.word	0x1
	.byte	0x52
	.quad	LVL196
	.quad	LVL198-1
	.word	0x1
	.byte	0x50
	.quad	LVL205
	.quad	LVL206
	.word	0x1
	.byte	0x50
	.quad	LVL253
	.quad	LVL254-1
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
LLST70:
	.quad	LVL220
	.quad	LVL250
	.word	0x3
	.byte	0x91
	.byte	0xa0,0x6d
	.quad	LVL261
	.quad	LVL262
	.word	0x3
	.byte	0x91
	.byte	0xa0,0x6d
	.quad	0
	.quad	0
LLST71:
	.quad	LVL220
	.quad	LVL225
	.word	0x1
	.byte	0x53
	.quad	LVL236
	.quad	LVL237
	.word	0x1
	.byte	0x53
	.quad	LVL239
	.quad	LVL241
	.word	0x1
	.byte	0x53
	.quad	LVL246
	.quad	LVL250
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
LLST72:
	.quad	LVL220
	.quad	LVL229
	.word	0x1
	.byte	0x56
	.quad	LVL233
	.quad	LVL250
	.word	0x1
	.byte	0x56
	.quad	LVL261
	.quad	LVL262
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST73:
	.quad	LVL222
	.quad	LVL249
	.word	0x1
	.byte	0x5c
	.quad	LVL261
	.quad	LVL262
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
LLST74:
	.quad	LVL222
	.quad	LVL229
	.word	0x1
	.byte	0x56
	.quad	LVL233
	.quad	LVL239
	.word	0x1
	.byte	0x56
	.quad	LVL245
	.quad	LVL246
	.word	0x1
	.byte	0x56
	.quad	LVL247
	.quad	LVL249
	.word	0x1
	.byte	0x56
	.quad	LVL261
	.quad	LVL262
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
LLST75:
	.quad	LVL223
	.quad	LVL226
	.word	0x1
	.byte	0x50
	.quad	LVL233
	.quad	LVL234-1
	.word	0x1
	.byte	0x50
	.quad	LVL236
	.quad	LVL238-1
	.word	0x1
	.byte	0x50
	.quad	LVL247
	.quad	LVL248
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
	.section __DWARF,__debug_pubnames,regular,debug
Lsection__debug_pubnames:
	.long	0x187
	.word	0x2
	.set L$set$236,Ldebug_info0-Lsection__debug_info
	.long L$set$236
	.long	0x1a0e
	.long	0xb93
	.ascii "__sigbits\0"
	.long	0xbbb
	.ascii "file_exist\0"
	.long	0xbf5
	.ascii "RemoveSpaces\0"
	.long	0xc30
	.ascii "err_setarg0\0"
	.long	0xc53
	.ascii "err_syswarn\0"
	.long	0xc80
	.ascii "dump_argv\0"
	.long	0xcd5
	.ascii "fork_pipes\0"
	.long	0xd27
	.ascii "Janitor\0"
	.long	0xd64
	.ascii "sighandler\0"
	.long	0xdd1
	.ascii "StartsWith\0"
	.long	0xe17
	.ascii "err_syserr\0"
	.long	0xe6e
	.ascii "err_vsyswarn\0"
	.long	0xece
	.ascii "err_sysexit\0"
	.long	0xf16
	.ascii "exec_pipe_command\0"
	.long	0xf7a
	.ascii "exec_nth_command\0"
	.long	0x10fb
	.ascii "spawn_proc\0"
	.long	0x113f
	.ascii "corpse_collector\0"
	.long	0x1181
	.ascii "exec_arguments\0"
	.long	0x11f9
	.ascii "exec_pipeline\0"
	.long	0x124e
	.ascii "dump_pipeline\0"
	.long	0x1296
	.ascii "main\0"
	.long	0x1981
	.ascii "arg0\0"
	.long	0x19d5
	.ascii "isSignal\0"
	.long	0x19f0
	.ascii "foreground\0"
	.long	0
	.section __DWARF,__debug_pubtypes,regular,debug
Lsection__debug_pubtypes:
	.long	0x37e
	.word	0x2
	.set L$set$237,Ldebug_info0-Lsection__debug_info
	.long L$set$237
	.long	0x1a0e
	.long	0xaf
	.ascii "signed char\0"
	.long	0xbe
	.ascii "unsigned char\0"
	.long	0xcf
	.ascii "short int\0"
	.long	0xee
	.ascii "short unsigned int\0"
	.long	0xdc
	.ascii "__uint16_t\0"
	.long	0x115
	.ascii "int\0"
	.long	0x104
	.ascii "__int32_t\0"
	.long	0x12e
	.ascii "unsigned int\0"
	.long	0x11c
	.ascii "__uint32_t\0"
	.long	0x14f
	.ascii "long long int\0"
	.long	0x13e
	.ascii "__int64_t\0"
	.long	0x172
	.ascii "long long unsigned int\0"
	.long	0x160
	.ascii "__uint64_t\0"
	.long	0x18c
	.ascii "long int\0"
	.long	0x198
	.ascii "sizetype\0"
	.long	0x1a4
	.ascii "char\0"
	.long	0x1c3
	.ascii "long unsigned int\0"
	.long	0x1ac
	.ascii "__darwin_size_t\0"
	.long	0x200
	.ascii "__va_list_tag\0"
	.long	0x1d8
	.ascii "__darwin_va_list\0"
	.long	0x275
	.ascii "__darwin_time_t\0"
	.long	0x28c
	.ascii "__darwin_blkcnt_t\0"
	.long	0x2a5
	.ascii "__darwin_blksize_t\0"
	.long	0x2bf
	.ascii "__darwin_dev_t\0"
	.long	0x2d5
	.ascii "__darwin_gid_t\0"
	.long	0x2eb
	.ascii "__darwin_ino64_t\0"
	.long	0x303
	.ascii "__darwin_mode_t\0"
	.long	0x31a
	.ascii "__darwin_off_t\0"
	.long	0x330
	.ascii "__darwin_pid_t\0"
	.long	0x346
	.ascii "__darwin_sigset_t\0"
	.long	0x35f
	.ascii "__darwin_suseconds_t\0"
	.long	0x37b
	.ascii "__darwin_uid_t\0"
	.long	0x391
	.ascii "gid_t\0"
	.long	0x39e
	.ascii "size_t\0"
	.long	0x3ac
	.ascii "uid_t\0"
	.long	0x3b9
	.ascii "passwd\0"
	.long	0x4a9
	.ascii "pid_t\0"
	.long	0x4b6
	.ascii "sigset_t\0"
	.long	0x4c6
	.ascii "sigval\0"
	.long	0x4f8
	.ascii "__siginfo\0"
	.long	0x5d0
	.ascii "siginfo_t\0"
	.long	0x5e1
	.ascii "__sigaction_u\0"
	.long	0x655
	.ascii "sigaction\0"
	.long	0x69f
	.ascii "fpos_t\0"
	.long	0x6ad
	.ascii "__sbuf\0"
	.long	0x6e3
	.ascii "__sFILE\0"
	.long	0x8e5
	.ascii "FILE\0"
	.long	0x8f1
	.ascii "timeval\0"
	.long	0x925
	.ascii "blkcnt_t\0"
	.long	0x935
	.ascii "blksize_t\0"
	.long	0x946
	.ascii "dev_t\0"
	.long	0x953
	.ascii "mode_t\0"
	.long	0x961
	.ascii "nlink_t\0"
	.long	0x970
	.ascii "off_t\0"
	.long	0x97d
	.ascii "time_t\0"
	.long	0x98b
	.ascii "stat\0"
	.long	0xb5c
	.ascii "Pipe\0"
	.long	0xb68
	.ascii "command\0"
	.long	0
	.section __DWARF,__debug_aranges,regular,debug
Lsection__debug_aranges:
	.long	0x4c
	.word	0x2
	.set L$set$238,Ldebug_info0-Lsection__debug_info
	.long L$set$238
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	Ltext0
	.set L$set$239,Letext0-Ltext0
	.quad L$set$239
	.quad	Ltext_cold0
	.set L$set$240,Letext_cold0-Ltext_cold0
	.quad L$set$240
	.quad	LFB22
	.set L$set$241,LFE22-LFB22
	.quad L$set$241
	.quad	0
	.quad	0
	.section __DWARF,__debug_line,regular,debug
Lsection__debug_line:
Ldebug_line0:
	.set L$set$242,LELT0-LSLT0
	.long L$set$242
LSLT0:
	.word	0x2
	.set L$set$243,LELTP0-LASLTP0
	.long L$set$243
LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf2
	.byte	0xd
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1
	.ascii "/usr/include"
	.byte	0
	.ascii "/usr/include/i386"
	.byte	0
	.ascii "/usr/include/sys"
	.byte	0
	.ascii "/usr/include/sys/_types"
	.byte	0
	.byte	0
	.ascii "c_posix.c\0"
	.byte	0
	.byte	0
	.byte	0
	.ascii "i386/_types.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "<built-in>\0"
	.byte	0
	.byte	0
	.byte	0
	.ascii "_types.h\0"
	.byte	0x3
	.byte	0
	.byte	0
	.ascii "_gid_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_size_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_uid_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "pwd.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "_pid_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_sigset_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "signal.h\0"
	.byte	0x3
	.byte	0
	.byte	0
	.ascii "stdio.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.ascii "_timeval.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_blkcnt_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_blksize_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_dev_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_mode_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_nlink_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_off_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "_time_t.h\0"
	.byte	0x4
	.byte	0
	.byte	0
	.ascii "stat.h\0"
	.byte	0x3
	.byte	0
	.byte	0
	.ascii "signal.h\0"
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
LELTP0:
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM69
	.byte	0x3
	.byte	0xed,0x2
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM70
	.byte	0x26
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM71
	.byte	0x38
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM72
	.byte	0x3
	.byte	0x50
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM73
	.byte	0x26
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM74
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM75
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM76
	.byte	0x3
	.byte	0x6f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM77
	.byte	0x47
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM78
	.byte	0x3
	.byte	0x61
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM79
	.byte	0x31
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM80
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM81
	.byte	0x14
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM82
	.byte	0x3
	.byte	0x64
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM83
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM84
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM85
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM86
	.byte	0x31
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM87
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM88
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM89
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM90
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM91
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM92
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM93
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM94
	.byte	0x3
	.byte	0xb9,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM95
	.byte	0x61
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM96
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM97
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM98
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM99
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM100
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM101
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM102
	.byte	0x2c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM103
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM104
	.byte	0x3
	.byte	0x69
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM105
	.byte	0x2e
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM106
	.byte	0x3
	.byte	0x69
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM107
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM108
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM109
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM110
	.byte	0x3
	.byte	0xad,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM111
	.byte	0x6a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM112
	.byte	0x3
	.byte	0xad,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM113
	.byte	0x6b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM114
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM115
	.byte	0x14
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM116
	.byte	0x26
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM117
	.byte	0x3
	.byte	0x54
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM118
	.byte	0x3
	.byte	0xf1,0x1
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM119
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM120
	.byte	0x3
	.byte	0xc7,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM121
	.byte	0xd0
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM122
	.byte	0x3
	.byte	0xbe,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM123
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM124
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM125
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM126
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM127
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM128
	.byte	0x3
	.byte	0xfc,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM129
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM130
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM131
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM132
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM133
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM134
	.byte	0x13
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM135
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM136
	.byte	0x96
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM137
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM138
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM139
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM140
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM141
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM142
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM143
	.byte	0x23
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM144
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM145
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM146
	.byte	0x23
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM147
	.byte	0xbe
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM148
	.byte	0x3
	.byte	0x90,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM149
	.byte	0x3
	.byte	0xf4,0x1
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM150
	.byte	0x3
	.byte	0x89,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM151
	.byte	0x63
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM152
	.byte	0x5a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM153
	.byte	0x13
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM154
	.byte	0x1f
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM155
	.byte	0x23
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM156
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM157
	.byte	0x20
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM158
	.byte	0x3
	.byte	0xd3,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM159
	.byte	0x3
	.byte	0xb2,0x3
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM160
	.byte	0x3
	.byte	0xce,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM161
	.byte	0x3
	.byte	0xb2,0x3
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM162
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM163
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM164
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM165
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM166
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM167
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM168
	.byte	0x14
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM169
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM170
	.byte	0x3
	.byte	0x84,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM171
	.byte	0x3
	.byte	0xfc,0x3
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM172
	.byte	0x3
	.byte	0x84,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM173
	.byte	0x3
	.byte	0xfc,0x3
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM174
	.byte	0x3
	.byte	0x84,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM175
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM176
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM177
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM178
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM179
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM180
	.byte	0x2f
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM181
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM182
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM183
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM184
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM185
	.byte	0x11
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM186
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM187
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM188
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM189
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM190
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM191
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM192
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM193
	.byte	0x3
	.byte	0x74
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM194
	.byte	0x3
	.byte	0xcf,0x3
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM195
	.byte	0x3
	.byte	0xbe,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM196
	.byte	0x5e
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM197
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM198
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM199
	.byte	0x75
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM200
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM201
	.byte	0x3
	.byte	0xa7,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM202
	.byte	0x3
	.byte	0xfe,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM203
	.byte	0x3
	.byte	0xe6,0x3
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM204
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM205
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM206
	.byte	0x3
	.byte	0xb7,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM207
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM208
	.byte	0x2b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM209
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM210
	.byte	0x3
	.byte	0x54
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM211
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM212
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM213
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM214
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM215
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM216
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM217
	.byte	0x11
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM218
	.byte	0x1f
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM219
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM220
	.byte	0x3
	.byte	0x53
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM221
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM222
	.byte	0x68
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM223
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM224
	.byte	0x3
	.byte	0xb6,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM225
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM226
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM227
	.byte	0x3
	.byte	0x90,0x4
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM228
	.byte	0x1f
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM229
	.byte	0x24
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM230
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM231
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM232
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM233
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM234
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM235
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM236
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM237
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM238
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM239
	.byte	0x21
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM240
	.byte	0x3
	.byte	0x6a
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM241
	.byte	0x32
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM242
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM243
	.byte	0x3
	.byte	0xaa,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM244
	.byte	0x3
	.byte	0x8b,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM245
	.byte	0x64
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM246
	.byte	0x3
	.byte	0xe0,0x2
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM247
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM248
	.byte	0x24
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM249
	.byte	0x27
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM250
	.byte	0x3
	.byte	0xea,0x7d
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM251
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM252
	.byte	0x3
	.byte	0x93,0x2
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM253
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM254
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM255
	.byte	0xf
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM256
	.byte	0x23
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM257
	.byte	0x12
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM258
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM259
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM260
	.byte	0x12
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM261
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM262
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM263
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM264
	.byte	0x12
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM265
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM266
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM267
	.byte	0x3
	.byte	0xe2,0x7d
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM268
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM269
	.byte	0x3
	.byte	0x59
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM270
	.byte	0x3e
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM271
	.byte	0x3
	.byte	0x5b
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM272
	.byte	0x3c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM273
	.byte	0x3
	.byte	0x5b
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM274
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM275
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM276
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM277
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM278
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM279
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM280
	.byte	0x3
	.byte	0x74
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM281
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM282
	.byte	0x23
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM283
	.byte	0x2d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM284
	.byte	0xf
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM285
	.byte	0x1f
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM286
	.byte	0xf
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM287
	.byte	0x20
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM288
	.byte	0xe
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM289
	.byte	0x22
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM290
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM291
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM292
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM293
	.byte	0x3
	.byte	0x54
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM294
	.byte	0x3f
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM295
	.byte	0x3
	.byte	0x67
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM296
	.byte	0x27
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM297
	.byte	0x3
	.byte	0xf6,0x1
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM298
	.byte	0x3
	.byte	0xd1,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM299
	.byte	0x3
	.byte	0xa3,0x4
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM300
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM301
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM302
	.byte	0x3
	.byte	0x9c,0x7c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM303
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM304
	.byte	0x15
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM305
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM306
	.byte	0x70
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM307
	.byte	0x3
	.byte	0xa2,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LHOTE59
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM8
	.byte	0xf2
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM9
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM10
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM11
	.byte	0x14
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM12
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM13
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM14
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM15
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM16
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM17
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM18
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	Letext_cold0
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM1
	.byte	0x3
	.byte	0xe6,0x2
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM2
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM3
	.byte	0x3
	.byte	0x80,0x7f
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM4
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM5
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM6
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM7
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM19
	.byte	0x3
	.byte	0x4c
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM20
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM21
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM22
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM23
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM24
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM25
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM26
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM27
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM28
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM29
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM30
	.byte	0x23
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM31
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM32
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM33
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM34
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM35
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM36
	.byte	0x3
	.byte	0xe0,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM37
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM38
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM39
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM40
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM41
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM42
	.byte	0x1d
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM43
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM44
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM45
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM46
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM47
	.byte	0x3
	.byte	0x72
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM48
	.byte	0x11
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM49
	.byte	0x34
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM50
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM51
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM52
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM53
	.byte	0x3
	.byte	0x68
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM54
	.byte	0x3
	.byte	0xf4,0x1
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM55
	.byte	0x1e
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM56
	.byte	0x1c
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM57
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM58
	.byte	0x1b
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM59
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM60
	.byte	0x21
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM61
	.byte	0x3
	.byte	0xf7,0x7e
	.byte	0x1
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM62
	.byte	0x1a
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM63
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM64
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM65
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM66
	.byte	0x16
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM67
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	LM68
	.byte	0x19
	.byte	0
	.byte	0x9
	.byte	0x2
	.quad	Letext0
	.byte	0
	.byte	0x1
	.byte	0x1
LELT0:
	.section __DWARF,__debug_str,regular,debug
Lsection__debug_str:
LASF6:
	.ascii "exec_pipeline\0"
LASF5:
	.ascii "exec_pipe_command\0"
LASF4:
	.ascii "status\0"
LASF0:
	.ascii "__sigaction_u\0"
LASF3:
	.ascii "__func__\0"
LASF2:
	.ascii "dump_argv\0"
LASF1:
	.ascii "args\0"
	.subsections_via_symbols
