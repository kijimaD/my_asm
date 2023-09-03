        .global _start
        .text

_start:
        ## レジスタへのコピー(8ビット)
        movb $0x21, %al
        movb $0x34, %ah
        movb $al, %cl
        movb val_b, %dl

        ## メモリへのコピー(8ビット)
        movb $0x01, val_b
        movb %al, val_b
        movb %ah, val_b

        ## レジスタへのコピー(16ビット)
        movw $0x1234, %ax
        movw %ax, %cx
        movw val_w, %dx

        ## メモリへのコピー(16ビット)
        movw $0x9abc, val_w

        movw %ax, val_w

        ## レジスタへのコピー(32ビット)
        movl $0x12345678, %eax
        movl %eax, %ecx
        movl val_l, %edx

        ## メモリへのコピー(32ビット)
        movl $0x89abcdef, val_l
        movl %eax, val_l

        ## 間接メモリ参照の例(32ビット)
        movl $val_b, %edx

        ## AL <- [EDX + 0]
        movb 0(%edx), %al
        ## AX <- [EDX + 1]
        movw 1(%edx), %ax

        ## EAX <- [EDX + 3]
        movl 3(%edx), %eax
        movl $3, %ecx

        ## EAX <- [val_b + ECX]
        movl val_b(%ecx), %eax

        ## EAX <- [EDX + ECX]
        movl (%edx,%ecx), %eax
        ## EAX <- [EDX + ECX * 2]
        movl (%edx,%ecx,2), %al

        movl $1, %eax

        int $0x80
        .data
val_b:  .byte
val_w:  .word
val_l:  .long
