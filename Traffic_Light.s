.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ GRN_PIN, 11
.equ YEL_PIN, 10
.equ RED_PIN, 6

.equ BUTTON, 29

.align 4
.text
.global main
main:
	push {lr}
	bl wiringPiSetup

	mov r0, #GRN_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #GRN_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#10000
	bl delay

	bl button
	mov r0, #GRN_PIN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #YEL_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #YEL_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#3000
	bl delay

	mov r0, #YEL_PIN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RED_PIN
	mov r1, #OUTPUT
	bl pinMode

	mov r0, #RED_PIN
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =#10000
	bl delay

	mov r0, #RED_PIN
	mov r1, #LOW
	bl digitalWrite

	mov r0, #GRN_PIN
	mov r1, #HIGH
	bl digitalWrite

	mov r0, #0
	pop {pc}


button:
	push {lr}
	mov r0, #BUTTON
	bl digitalRead
	pop {pc}

do_whl:
	push {lr}

	bl button
	cmp r0, #HIGH
	beq done

	mov r0, #0
	bl time

done:
	pop {pc}

