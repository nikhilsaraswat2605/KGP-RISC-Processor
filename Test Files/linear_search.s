main:
    xor $20, $20        
    addi $20, 1
    addi $20, 1
    addi $20, 1
    addi $20, 1
    xor $21, $21
    addi $21, 5
    addi $21, 5        
    xor $8, $8          
    lw $9, -4($20)
    b outter_loop
element_is_found: 
    xor $19, $19
    add $19, $8         
    b exit
element_is_not_found:
    xor $19, $19
    addi $19, -1
    b exit 
outter_loop:
    xor $10, $10        
    add $10, $8
    comp $11, $21
    add $10, $11        
    bz $10, element_is_not_found    
    xor $12, $12
    add $12, $8
    shll $12, 2 
    addi $12, -1        
    add $12, $20
    addi $12, 1        
    lw $13, 0($12)      
    xor $14, $14
    comp $15, $13
    add $14, $9
    add $14, $15        
    bz $14, element_is_found       
    addi $8, 1          
    b outter_loop       
exit:
    xor $16, $16
    addi $16, 1         