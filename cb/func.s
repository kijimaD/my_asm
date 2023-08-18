        # cc -o  func func.s
        # ./func
        # echo $?

        .intel_syntax noprefix
        .globl plus, main

plus:
        add rsi, rdi    # 第1引数のレジスタの値を上書きする形で結果が保存される
        mov rax, rsi    # 関数からの返り値はRAXに入れる
        ret

main:
        mov rdi, 3      # 第1引数はRDIレジスタに入れる
        mov rsi, 4      # 第2引数はRSIレジスタに入れる
        call plus
        ret

        # ================
        # 以下に相当する:
        # int plus(int x, int y) {
        #   return x + y;
        # }

        # int main() {
        #   return plus(3, 4);
        # }
