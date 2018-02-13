;6.115 Lab1 Exercise 2
;The main loop or body of the typewriter program
;Albert Wu

.org 00h					;power up and reset vector
    ljmp start				;jump to the beginning of the program (start)
							;which is stored in 100h
.org 100h					;set vector to 100h
start:						
    lcall init				;call subroutine "init" to start serial port
	loop:					;loop over
	  lcall getchr			;call subroutine "getchr" to get character from PC keyboard
	  lcall sndchr			;call subroutine "sndchr" to print character on PC screen
	  mov p1, a				;move the received character to P1(LED)
	sjmp loop
	
init:
;set up serial port with 11.0592 MHz crystal
;use timer 1 for 9600 baud serial communication
	mov tmod, #20h			;MCS-51 Programmer's Guide P2-16: set timer 1 for auto reload-mode2
	mov tcon, #40h			;run timer 1
	mov th1, #0fdh			;set 9600 baud with xtal=11.059MHz, SMOD = 0
	mov scon, #50h			;set to 8 bit mode 1
	ret						;return from subroutine
	
getchr:
;gets a character from PC using serial. RI is SCON.0. ASCII code is returned in the accumulator
	jnb ri, getchr			;if ri is not set, jump to getchr
	mov a, sbuf				;get character from serial data buffer to accumulator
	anl a, #7fh				;mask off 8th bit
	clr ri					;clear receive status flag
	ret


sndchr:
;sends a character to PC using serial. Sends the character in accumulator. SCON.1 and TI are the same
	clr scon.1				;clear the ti complete flag
	mov sbuf, a				;move a character from acc to the sbuf
txloop:
	jnb scon.1, txloop		;if scon.1 is not set, jump to txloop
	ret
	
	