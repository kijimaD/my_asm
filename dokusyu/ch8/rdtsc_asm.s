        # IA-32アーキテクチャのCPUが持っているRDTSCPという命令を実行し、CPUの現在のクロックカウンタを取得する4

        # gcc -fno-pic -c -o rdtsc.o rdtsc.c
        # as -o rdtsc_asm.o rdtsc_asm.s
        # gcc -o rdtsc rdtsc.o rdtsc_asm.o -no-pie
        # ./rdtsc

        .global rdtsc           # シンボルsum_asmを外部から参照可能に
        .text                   # .textセクション開始
rdtsc:
        rdtscp                  # CPUのTSCを取得する(EDX:EAXに格納される)
        ret                     # 下位32ビットを返り値として返す
