main:
        ;; i = 123
	movl	$123, i(%rip)
	movl	i(%rip), %eax
        ;; i = i + 1
	addl	$1, %eax
	movl	%eax, i(%rip)
        ;; j = 456
	movl	$456, j(%rip)
        ;; j = i + j
	movl	i(%rip), %edx
	movl	j(%rip), %eax
	addl	%edx, %eax
	movl	%eax, j(%rip)
        ;; return j
	movl	j(%rip), %eax
	ret
