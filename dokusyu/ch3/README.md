```
$ gcc -fno-pic -fomit-frame-pointer -c -o abc.o abc.c
$ objdump -s -j .data abc.o
```

result

```
abc.o:     file format elf64-x86-64

Contents of section .data:
 0000 41424300                             ABC.
```
