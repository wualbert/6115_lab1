;6.115 Lab 1 Exercise 1 Functionally Equivalent Program
;Albert Wu
clr A            ;Clears accumulator byte (special command)
mov P1, A        ;Moves value in A to P1
setb P1          ;Set P1 as 1
loop:
    sjmp loop
    