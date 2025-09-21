.data 
msg:
    .asciz "Hello World\n"
.text
.globl _start
_start:
    la a0, msg #load address of string into a0
    li a7,4 #print a string 
    ecall #execute
    li a7,10 #exit
    ecall
    