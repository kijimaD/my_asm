        .ascii  "Hello, World!\n"
        .asciz  "Welcome, Back!\n"
        .asciz  "\\T\105S\X54"

        // .asciiはオペランドに指定された文字列定数に対応するバイト列を生成する疑似命令
        // .ascizは末尾に0x00の1バイトが余計に生成される。文字列がヌルで終端している文字列を生成するのに使う
