# ピリオドから始まる命令はGASの疑似命令(アセンブラに対する指示)

        .file   "add.c"
        .text
        .global main
        .type   main, @function
main:
.LFB0:
        .cfi_startproc
        movl    i, %eax
        addl    $5678, %eax
        movl    %eax, i
