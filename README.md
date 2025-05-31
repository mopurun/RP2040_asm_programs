# RP2040_asm_programs

Raspberry Pi Pico RP2040をアセンブリ言語で動かしてみました。

boot2コードが入ったboot2.asmを用意する必要があります

uf2の作成は以下のツールを使いました

https://github.com/microsoft/uf2

### boot2.asmの書き方

<pre>
.syntax unified
.cpu cortex-m0plus
.thumb
.section .boot2, "ax"
.word 0x4b32b500, 0x60582021, 0x21026898, 0x60984388
～中略～
.word 0x00000000, 0x00000000, 0x00000000, 0x7a4eb274
</pre>
