;6.115 Lab1 Exercise 1
;Albert Wu

;This little program turns an LED on
mov P1, #00h    ;Clear the LED bank
mov P1, #01h    ;Turn on a single light
loop:
    sjmp loop
