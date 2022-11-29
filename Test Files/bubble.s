main:
    xor $21, $21
    xor $20, $20      
    addi $21, 10       
    xor $9, $9
    xor $8, $8        
    b outter_loop 
outter_loop:
    xor $10, $10
    comp $11, $21
    add $10, $8
    add $10, $11
    addi $10, 1       
    bz $10, exit_outter_loop  
    xor $9, $9   
    b Inner_loop 
swap_two_numbers:
    lw $19, 0($5)
    sw $19, 0($4)
    lw $18, 0($4)
    sw $18, 0($5)
    br $31
    b exit_Inner_loop   
Inner_loop:
    xor $11, $11
    add $11, $10       
    add $11, $9
    bz $11, exit_Inner_loop   
    xor $12, $12
    add $12, $9
    shll $12, 2        
    add $12, $20        
    lw $13, 0($12)     
    xor $4, $4
    add $4, $12
    addi $12, 4
    lw $14, 0($12)     
    xor $5, $5
    add $5, $12
    comp $15, $14
    add $13, $15       
    bltz $13, Increase_j_by_one
    bz $13, Increase_j_by_one
    bl swap_two_numbers  
    b Increase_j_by_one               
Increase_j_by_one:
    addi $9, 1         
    b Inner_loop
exit_Inner_loop:
    addi $8, 1          
    b outter_loop
exit_outter_loop:
    xor $16, $16    
    addi $16, 1        
