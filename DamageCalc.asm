;User defined calculation

;Register b contains the move damage
;Register c contains the player/enemy attack
;Register d contains the enemy/player defence
;Register a should contain the output at the end of the function

DamageCalc: MACRO 
	ld hl, 0
	push de
	ld d, 0
	ld e, b
	ld l, c
	add hl, de
	pop de
	
	ld a, h
	or a
	jr z, DamageCalc_NO_OVERFLOW
	
	ld hl, 255
	
DamageCalc_NO_OVERFLOW:
	ld a, l
	ld b, d
	ld c, 0
	call DIVIDE
	ld a, c
	ENDM
	
EnemyDamageCalc: MACRO
	ld hl, 0
	push de
	ld d, 0
	ld e, b
	ld l, c
	add hl, de
	pop de
	
	ld a, h
	or a
	jr z, EnemyDamageCalc_NO_OVERFLOW
	
	ld hl, 255
	
EnemyDamageCalc_NO_OVERFLOW:
	ld a, l
	ld b, d
	ld c, 0
	call DIVIDE
	ld a, c
	
	
	ENDM