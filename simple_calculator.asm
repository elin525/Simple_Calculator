%macro	print 	2
        mov     rax, 1					;SYS_write
        mov     rdi, 1					;standard output device
        mov     rsi, %1					;output string address
        mov     rdx, %2					;number of character
        syscall						;calling system services
%endmacro

%macro	scan 	2
        mov     rax, 0					;SYS_read
        mov     rdi, 0					;standard input device
        mov     rsi, %1					;input buffer address
        mov     rdx, %2					;number of character
        syscall						;calling system services
%endmacro

section .bss
buffer      resb    10
num1        resb    1
num2        resb    1
num3        resb    1
num4        resb    1
num5        resb    1
total	    resb    1
result      resb    10

sym1        resb    1
sym2        resb    1
sym3        resb    1
sym4        resb    1

section .data
LF	equ	10
NULL	equ	0
msg         db      "Enter Operation String: "
equal       db      " = "
ascii       db      "00", 10

section .text
        global _start

_start: 
	;"a+b*c/d-e"
	;"a*b-c+d/e"

	; cout << masg
    	print   msg, 24
    	;cin >> buffer
    	scan    buffer, 10
    	
    	mov 	al, byte[buffer+0]		;al='6'=0x36
    	and 	al, 0fh				;al=0x36 and 0x0f = 0x06 = 6
    	mov 	byte[num1], al			;[num1]=a

    	mov 	al, byte[buffer+2]
    	and 	al, 0fh
    	mov 	byte[num2], al			;[num2]=b

    	mov 	al, byte[buffer+4]
    	and 	al, 0fh
    	mov 	byte[num3], al			;[num3]=c

    	mov 	al, byte[buffer+6]
    	and 	al, 0fh
    	mov 	byte[num4], al			;[num4]=d

    	mov 	al, byte[buffer+8]
    	and 	al, 0fh
    	mov 	byte[num5], al			;[num5]=e

    	mov 	al, byte[buffer+1]
    	mov 	byte[sym1], al			;[sym1]='+'

    	mov 	al, byte[buffer+3]
    	mov 	byte[sym2], al			;[sym2]='*'
   
    	mov 	al, byte[buffer+5]
    	mov 	byte[sym3], al			;[sym3]='-'

    	mov 	al, byte[buffer+7]
    	mov 	byte[sym4], al			;[sym4]='/'

	mov	al, byte[num1]			;[total] = num1
	mov	byte[total], al				
	
	; The below section evaluates which operator sym1 is (+, -, /, or *) and jumps to the matching section
	cmp	byte[sym1], '+'		; Compares sym1 to '+'			
	jne	skip11			; If sym1 != '+', jump to "skip11" 
	mov	dil, byte[total]	; Lines 83-84, moves total and num2 into dil and sil
	mov	sil, byte[num2]
	call	addition		; Since '+' must = sym1, call addition
	
skip11:
	cmp	byte[sym1], '-'		; Compares sym1 to '-'
	jne	skip12			; If sym1 != '-', jump to "skip12"
	mov	dil, byte[total]	; Lines 91-92, moves total and num2 into dil and sil
	mov	sil, byte[num2]
	call	subtraction		; Since '-' must = sym1, call subtraction
	
skip12:
	cmp	byte[sym1], '*'		; Compares sym1 to '*'			
	jne	skip13			; If sym1 != '*', jump to "skip13"
	mov	dil, byte[total]	; Lines 100-101: moves total and num2 into dil and sil
	mov	sil, byte[num2]
	call	multiplication		; Since '*' must = sym1, call multiplication
	
skip13:
	cmp	byte[sym1], '/'		; Compares sym1 to '/'
	jne	skip14			; If sym1 != '/', jump to skip14
	mov	dil, byte[total]	; Lines 108-109: moves total and num2 into dil and sil
	mov	sil, byte[num2]
	

; The below section evaluates which operator sym2 is (+, -, /, or *) and jumps to the matching section
skip14:
	cmp	byte[sym2], '+'		; Compares sym2 to '+'			
	jne	skip15			; If sym1 != '+', jump to "skip15" 
	mov	dil, byte[total]	; Lines 83-84, moves total and num3 into dil and sil
	mov	sil, byte[num3]
	call	addition		; Since '+' must = sym2, call addition
	
skip15:
	cmp	byte[sym2], '-'		; Compares sym2 to '-'
	jne	skip16			; If sym1 != '-', jump to "skip16"
	mov	dil, byte[total]	; Lines 91-92, moves total and num3 into dil and sil
	mov	sil, byte[num3]
	call	subtraction		; Since '-' must = sym2, call subtraction
	
skip16:
	cmp	byte[sym2], '*'		; Compares sym2 to '*'			
	jne	skip17			; If sym1 != '*', jump to "skip17"
	mov	dil, byte[total]	; Lines 100-101: moves total and num3 into dil and sil
	mov	sil, byte[num3]
	call	multiplication		; Since '*' must = sym2, call multiplication
	
skip17:
	cmp	byte[sym2], '/'		; Compares sym2 to '/'
	jne	skip18			; If sym1 != '/', jump to skip18
	mov	dil, byte[total]	; Lines 108-109: moves total and num3 into dil and sil
	mov	sil, byte[num3]
	call	division		; Since '/' must = sym2, call division
	
; The below section evaluates which operator sym3 is (+, -, /, or *) and jumps to the matching section
skip18:
	cmp	byte[sym3], '+'		; Compares sym3 to '+'			
	jne	skip19			; If sym1 != '+', jump to "skip19" 
	mov	dil, byte[total]	; Lines 83-84, moves total and num4 into dil and sil
	mov	sil, byte[num4]
	call	addition		; Since '+' must = sym3, call addition
	
skip19:
	cmp	byte[sym3], '-'		; Compares sym3 to '-'
	jne	skip20			; If sym1 != '-', jump to "skip20"
	mov	dil, byte[total]	; Lines 91-92, moves total and num4 into dil and sil
	mov	sil, byte[num4]
	call	subtraction		; Since '-' must = sym3, call subtraction
	
skip20:
	cmp	byte[sym3], '*'		; Compares sym3 to '*'			
	jne	skip21			; If sym1 != '*', jump to "skip21"
	mov	dil, byte[total]	; Lines 100-101: moves total and num4 into dil and sil
	mov	sil, byte[num4]
	call	multiplication		; Since '*' must = sym3, call multiplication
	
skip21:
	cmp	byte[sym3], '/'		; Compares sym3 to '/'
	jne	skip22			; If sym1 != '/', jump to skip22
	mov	dil, byte[total]	; Lines 108-109: moves total and num4 into dil and sil
	mov	sil, byte[num4]
	call	division		; Since '/' must = sym3, call division
	
; The below section evaluates which operator sym4 is (+, -, /, or *) and jumps to the matching section
skip22:
	cmp	byte[sym4], '+'		; Compares sym4 to '+'			
	jne	skip23			; If sym1 != '+', jump to "skip23" 
	mov	dil, byte[total]	; Lines 83-84, moves total and num5 into dil and sil
	mov	sil, byte[num5]
	call	addition		; Since '+' must = sym4, call addition
	
skip23:
	cmp	byte[sym4], '-'		; Compares sym4 to '-'
	jne	skip24			; If sym1 != '-', jump to "skip12"
	mov	dil, byte[total]	; Lines 91-92, moves total and num5 into dil and sil
	mov	sil, byte[num5]
	call	subtraction		; Since '-' must = sym4, call subtraction
	
skip24:
	cmp	byte[sym4], '*'		; Compares sym4 to '*'			
	jne	skip25			; If sym1 != '*', jump to "skip12"
	mov	dil, byte[total]	; Lines 100-101: moves total and num5 into dil and sil
	mov	sil, byte[num5]
	call	multiplication		; Since '*' must = sym4, call multiplication
	
skip25:
	cmp	byte[sym4], '/'		; Compares sym4 to '/'
	jne	done			; If sym1 != '/', jump to end
	mov	dil, byte[total]	; Lines 108-109: moves total and num5 into dil and sil
	mov	sil, byte[num5]
	call	division		; Since '/' must = sym4, call division
	 

done:
	;
    	lea 	rsi, [result]				;point to the adress of result
    	lea 	rdi, [total]				;point to the adress of total
    	call 	toString

	;display result
	print	buffer, 9
	print	equal, 3
    	print 	result, 10
    	

	mov     rax, 60					;terminate program
        mov     rdi, 0					;exit status
        syscall						;calling system services
        
; The below section evaluates which operator sym is (+, -, /, or *) and jumps to the matching section
addition:				; Lines 223-224: Performs addition
	mov	al, dil 			
	add	al, sil				
	mov	byte[total], al		; Updates value of total
	ret				; Returns back to line prior to calling
	
subtraction:				; Lines 229-230: Performs subtraction
	mov	al, dil 			
	sub	al, sil				
	mov	byte[total], al		; Updates value of total
	ret				; Returns back to line prior to calling

multiplication:				; Lines 235-236: Performs multiplication
	mov	al, dil 			
	mul	sil				
	mov	byte[total], al		; Updates value of total
	ret				; Returns back to line prior to calling
	
division:				; Lines 241-242: Performs division
	mov	al, dil
	cbw 			
	div	sil				
	mov	byte[total], al		; Updates value of total
	ret				; Returns back to place prior to calling

; Integer to String function
toString:
	; Part A - Successive division
	movzx 	eax, byte[rdi]		 		;get integer
	mov 	rcx, 0 					;digitCount = 0
	mov 	ebx, 10 				;set for dividing by 10
divideLoop:
	mov 	edx, 0
	div 	ebx 					;divide number by 10
	push 	rdx 					;push remainder
	inc 	rcx 					;increment digitCount
	cmp 	eax, 0 					;if (quotient != 0)
	jne 	divideLoop 				;goto divideLoop

	; Part B - Convert remainders and store
	mov 	rbx, rsi 				;get addr of ascii
	mov 	rdi, 0 					;rdi = 0
popLoop:
	pop 	rax 					;pop intDigit
	add 	al, "0" 				;al = al + 0x30
	mov 	byte [rbx+rdi], al 			;string[rdi] = al
	inc 	rdi 					;increment rdi
	loop 	popLoop 				;if (digitCount > 0) goto popLoop
	mov 	byte [rbx+rdi], LF 			;string[rdi] = newline
	ret

