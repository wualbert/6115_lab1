;6.115 Lab1 Exercise 1 MSB Exercise
;Albert Wu

;This little program turns an LED on
mov P1, #00h    ;Clear the LED bank
mov P1, #80h    ;Turn on MSB
loop:
    sjmp loop
