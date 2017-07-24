# README

Compile:
*          nasm bootloader.asm -o boot.bin

Create img: 
*          dd if=boot.bin of=boot.img conv=notrunc
or
*          dd if=boot.bin bs=512 of=boot.img conv=notrunc

# bootloader
