# as -o cpuid.o cpuid.s
# ld -o cpuid cpuid.o
# ./cpuid
# echo $?

        .global _start
        .text
_start:
        movl    $1, %eax        # 1:CPU の情報・機能ビットを取得
        cpuid
        movl    %edx, %ebx      # レジスタEDXの値をレジスタEBXにコピー
        shrl    $24, %ebx       # 24ビット右シフト
        movl    $1, %eax        # システムコール1番はexit
        int     $0x80           # システムコール呼び出し

# CPUID命令はCPUの詳細な情報を取得できるIA-32アーキテクチャに固有の命令
