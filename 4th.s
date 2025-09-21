.data
prompt: .asciz "Enter height n: \n"
newline: .asciz "\n"
star: .asciz "*"

.text
.globl _start
_start:
    # Print prompt message
    la a0, prompt       
    li a7, 4          # syscall: print string
    ecall

    # Read integer input (height n)
    li a7, 5          # syscall: read int (may not work in Ripes)
    ecall
    mv t0, a0         # store input n in t0

    # Outer loop variable i = 1
    li t1, 1          # i = 1

outer_loop:
    bgt t1, t0, end_outer_loop   # if i > n, exit outer loop

    # Inner loop variable j = 1
    li t2, 1

inner_loop:
    bgt t2, t1, end_inner_loop   # if j > i, end inner loop

    # Print star
    la a0, star
    li a7, 4
    ecall

    addi t2, t2, 1               # j++

    jal zero, inner_loop         # repeat inner loop

end_inner_loop:
    # Print newline
    la a0, newline
    li a7, 4
    ecall

    addi t1, t1, 1               # i++

    jal zero, outer_loop         # repeat outer loop

end_outer_loop:
    # Exit program
    li a7, 10
    ecall
