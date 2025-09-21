.data
makopo_kopo: .asciz "makopo-kopo(20L): \n"
remaining: .asciz "remaining: \n"
user_message: .asciz "enter the AMOUNT of grain in litres(L): \n"

.text
.global _start #makes start visible
_start:
    #displaying message for the user
    la a0, user_message #retrieving message variable
    li a7, 4 #printing on screen
    ecall
    
    #taking information from the user
    li a7, 5 #reading input from the user
    ecall
    mv t0, a0 #store user input
    
    #calculating the number of makopo-kopo the grain makes
    li t1, 20 #storing 20 
    div t2, t0, t1 #N.of makopo-kopo
    rem t3, t0, t1 #remaining grain
    
    #printing number of makopo-kopo
    la a0, makopo_kopo
    li a7, 4
    ecall
    mv a0, t2
    li a7, 1 #print int on the screen
    ecall
    
    #print the remaining grain
    la a0, remaining
    li a7,4
    ecall
    mv a0, t3
    li a7, 1
    ecall
    
    li a7, 10
    ecall
    