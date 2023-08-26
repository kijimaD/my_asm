        .global _start
        .text           # .textセクションの開始
_start:
        movl i, %eax    # EAX <- 1234
        movl %eax, j    # [j] <- EAX
        .data           # .dataセクションの開始
i:
        .long 1234      # 32ビットの整数1234を確保
        .lcomm j, 4     # .bssセクションに4バイトを確保
