        # このプログラムは123と456が等しいかチェックし、等しければ"equal"、等しくなければ"not equal"と標準出力に表示する
        # as -o cmp.o cmp.s
        # ld -o cmp cmp.o
        # ./cmp

        .global _start
        .text
_start:
        movl    $123, %eax      # EAXに123を格納
        cmpl    $456, %eax      # EAXは456か?
        je      L1              # もしそうならL1にジャンプ
        # 一致しなかった場合の処理
        movl    $msg_neq, %ecx  # ECXにラベルmsg_neqのアドレスを格納
        movl    $10, %edx       # 文字列の長さ10文字
        jmp     L2              # L2にジャンプ
L1:
        # 一致した場合の処理
        movl    $msg_eq, %ecx   # ECXにラベルmsg_eqのアドレスを格納
        movl    $6, %edx        # 文字列の長さ6文字
L2:
        # 合流部分
        movl    $4, %eax        # システムコール4番はwrite。レジスタEAXでシステムコール番号を指定する。writeシステムコールでは、レジスタEBXでファイルディスクリプタを、レジスタECXで文字列が格納されているアドレスを、レジスタEDXで出力する文字列長を指定する
        movl    $1, %ebx        # 標準出力(1)
        int     $0x80           # システムコール呼び出し

        movl    $1, %eax        # 1番はexit
        int     $0x80           # システムコール呼び出し

        .data
msg_eq:  .ascii "equal\n"       # .asciiは擬似命令
msg_neq: .ascii "not equal\n"
