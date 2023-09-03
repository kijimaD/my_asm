// gcc -o write write.c -no-pie
// ./write

// gcc -S -fno-pic write.c

// Hello, Worldを標準出力する

char *str = "Hello, World\n";

int main(void) {
  asm ("movl str, %ecx"); // ECX 文字列のアドレス
  asm ("movl $14, %edx"); // EDX 文字列の長さ
  asm ("movl $4, %eax"); // システムコール4番はwrite
  asm ("movl $1, %ebx"); // 標準出力(1)
  asm ("int $0x80");     // システムコール呼び出し interrupt命令。割込番号80はシステムコール
}
