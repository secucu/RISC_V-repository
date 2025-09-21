.data
prompt:      .asciz "Enter day number (1-7): "
err_msg:     .asciz "Error: Invalid day\n"
day1:        .asciz "Mantaha\n"
day2:        .asciz "Labobeli\n"
day3:        .asciz "Laboraro\n"
day4:        .asciz "Labone\n"
day5:        .asciz "Labohlano\n"
day6:        .asciz "Moqebelo\n"
day7:        .asciz "Sontaha\n"

.text
.globl _start
_start:
    # Print prompt message
    la a0, prompt
    li a7, 4
    ecall

    # Read input number
    li a7, 5          # syscall read integer (may not be supported in all simulators)
    ecall
    mv t0, a0        # store input in t0

    # Check if input is <1 or >7 - print error if true
    li t1, 1
    blt t0, t1, error_print
    li t1, 7
    bgt t0, t1, error_print

    # Main jump table (days)
    beq t0, t1, print_day7    # if 7 jump to day7
    li t1, 6
    beq t0, t1, print_day6
    li t1, 5
    beq t0, t1, print_day5
    li t1, 4
    beq t0, t1, print_day4
    li t1, 3
    beq t0, t1, print_day3
    li t1, 2
    beq t0, t1, print_day2
    li t1, 1
    beq t0, t1, print_day1

error_print:
    la a0, err_msg
    li a7, 4
    ecall
    j exit

print_day1:
    la a0, day1
    li a7, 4
    ecall
    j exit

print_day2:
    la a0, day2
    li a7, 4
    ecall
    j exit

print_day3:
    la a0, day3
    li a7, 4
    ecall
    j exit

print_day4:
    la a0, day4
    li a7, 4
    ecall
    j exit

print_day5:
    la a0, day5
    li a7, 4
    ecall
    j exit

print_day6:
    la a0, day6
    li a7, 4
    ecall
    j exit

print_day7:
    la a0, day7
    li a7, 4
    ecall

exit:
    li a7, 10      # exit syscall
    ecall
