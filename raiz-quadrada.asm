.data

     prompt: .asciiz "Enter a number "
     message: .asciiz "\nsqrt of the number is "
     
.text

     main:
          
          # pointer for while
          li $t1, 0
          
          # jump an link to read function
          jal read
              
          while:
                              
               # increment counter
               add $t1, $t1, 1
               
               # multiply counter and const
               mul $t2, $t1, 2
             
               # sub user's number and $t2
               sub $t0, $t0, $t2
               
               # plus one in the result
               add $t0, $t0, 1

               # conditional less than zero
               bltz $t0, sqtr
               
               # rewind
               j while

          sqtr:

               # display message
               li $v0, 4
               la $a0, message
               syscall
     
               # print sqrt
               sub $t1, $t1, 1
               li $v0, 1
               move $a0, $t1
               syscall          

          # end
          li $v0, 10
          syscall
          
     read:
             
           # print prompt
           li $v0, 4
           la $a0, prompt
           syscall
     
           # get user number
           li $v0, 5
           syscall
     
           # store users's number
           move $t0, $v0
              
           # return
           jr $ra     
