        # cc -o  ret ret.s
        # ./ret
        # echo $?

        .intel_syntax noprefix
        .global main
main:
        mov rax, 42
        ret
