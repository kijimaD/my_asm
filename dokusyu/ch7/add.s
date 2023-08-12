        # as -a -o add.o add.s
        # -aはアセンブル結果を標準出力するオプション

        .global _start
        .text
_start:
        movl    $12,%eax  # レジスタEAXに12を格納する
        addl    $34,%eax  # レジスタEAXに34を加える

        movl    %eax,%ebx # レジスタEAXの値をレジスタEBXにコピー
        movl    $1,%eax   # システムコール1番はexit
        int     $0x80     # システムコール実行



# GAS LISTING add.s                       page 1


#   1                            .global _start
#   2                            .text
#   3                    _start:
#   4 0000 B80C0000              movl    $12,%eax  # レジスタEAXに12を格納する
#   4      00
#   5 0005 83C022                addl    $34,%eax  # レジスタEAXに34を加える
#   6
#   7 0008 89C3                  movl    %eax,%ebx # レジスタEAXの値をレジスタEBXにコピー
#   8 000a B8010000              movl    $1,%eax   # システムコール1番はexit
#   8      00
#   9 000f CD80                  int     $0x80     # システムコール実行

# GAS LISTING add.s                       page 2


# DEFINED SYMBOLS
#                add.s:3      .text:0000000000000000 _start

# NO UNDEFINED SYMBOLS

# <ソースコードの行番号>、<生成された機械語のプログラム>、<逆アセンブル結果>
