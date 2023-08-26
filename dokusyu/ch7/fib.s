	.file	"fib.c"         // 疑似命令.fileによってここから新しい論理ファイルが始まることをGASに伝える
	.text                   // 疑似命令.textによってここから.textセクションが始まることをGASに伝える
	.globl	fib             // シンボルfibを他のオブジェクトファイルから参照可能とするようにGASに指示。リンカldによってオブジェクトファイルを結合するときに、シンボルfibが他のオブジェクトファイルから参照できるようになる
	.type	fib, @function  // シンボルfibの種類をGASに伝える。種類にはfunction や object がある
fib:
.LFB0:                          // ピリオドから始まっているが、末尾にコロンがあるのでラベル。.Lから始まるラベルはELF形式のファイルで利用される局所ラベル
	.cfi_startproc          // Call Frame Information初期化を指示する。CFIはプログラムのデバッグ時に利用される情報
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	cmpl	$1, -20(%rbp)
	jne	.L4
	movl	$1, %eax
	jmp	.L3
.L4:
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fib
	movl	%eax, %ebx
	movl	-20(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	fib
	addl	%ebx, %eax
.L3:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fib, .-fib      // 疑似命令.sizeはシンボルの大きさをGASに指示する。GASでは単独のピリオドは現在のアドレスを示す。.-fibは、「現在のアドレス - fibの開始アドレス」を意味する
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$10, %edi
	call	fib
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"  // タグ情報をオブジェクトファイルに埋め込む
	.section	.note.GNU-stack,"",@progbits // オペランドに指定したセクションを作成することをGASに伝える
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
