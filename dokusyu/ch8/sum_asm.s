        # gcc -fno-pic -c -o sum.o sum.c
        # as -o sum_asm.o sum_asm.s
        # gcc -o sum sum.o sum_asm.o -no-pie
        # ./sum

        .global sum_asm         # シンボルsum_asmを外部から参照可能にする
        .text                   # .textセクション開始
sum_asm:
        movl    $0, %eax        # EAX <- 0
        movl    $array, %edx    # EDX <- 配列arrayのアドレス
        movl    array_size,%ecx # ECX <- 配列の大きさ
L1:
        add (%edx), %eax        # EAXに配列の要素を加算
        add $4,    %edx         # 配列のアドレスを+4(intは32ビットなので)
        loop       L1           # ECXを-1し、ゼロでなければL1にジャンプ
        ret                     # 計算結果はレジスタEAXに格納されている
