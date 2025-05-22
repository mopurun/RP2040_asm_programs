cd %~dp0
rem make made by mopurun
arm-none-eabi-as -mcpu=cortex-m0 -mthumb -o main.out main.asm
arm-none-eabi-ld --section-start .boot2=0x10000000 --section-start .vt=0x10000100 -o main.elf main.out

arm-none-eabi-objcopy -O ihex main.elf firmware.hex
arm-none-eabi-objcopy -O binary main.elf firmware.bin
arm-none-eabi-objdump -m cortex-m0plus -D main.elf > objdump.txt
python C:\mp_content\SOFT\uf2-master\utils\uf2conv.py -f 0xe48bff56 -o firmware.uf2 firmware.hex