コンパイル。
```
$ gcc -c add.c
```

アセンブリ言語のプログラムadd.sにコンパイルする。
```
$ gcc -S -fno-pic -fomit-frame-pointer add.c
```

アセンブリ言語で書かれたプログラムadd.sを機械語に変換する。
```
$ as -o add.o add.s
```

アセンブラに-aオプションを指定すると、アセンブル結果を標準出力に表示する。

```
$ as -a -o add.o add.s
```
