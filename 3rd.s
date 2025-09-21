.data
prompt:           .asciz "Enter number of cattle: \n"
not_enough:       .asciz "Not enough for bohali\n"
small_herd:       .asciz "Small herd\n"
wealthy_owner:    .asciz "Wealthy cattle owner\n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt       
    li a7, 4            # print string syscall
    ecall

    # Read number of cattle (input)
    # Note: This syscall may not work in Ripes
    li a7, 5            # read integer syscall
    ecall
    mv t0, a0           # store input in t0

    # If number < 10 => Not enough
    li t1, 10
    blt t0, t1, not_enough_label #for comparing variables

    # If number < 50 => Small herd
    li t1, 50
    blt t0, t1, small_herd_label

    # Else => Wealthy cattle owner
    j wealthy_owner_label

not_enough_label:
    la a0, not_enough
    li a7, 4            # print string syscall
    ecall
    j exit

small_herd_label:
    la a0, small_herd
    li a7, 4            # print string syscall
    ecall
    j exit

wealthy_owner_label:
    la a0, wealthy_owner
    li a7, 4            # print string syscall
    ecall

exit:
    li a7, 10           # exit syscall
    ecall
