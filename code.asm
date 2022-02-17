//Exercice 1

//1) Traduction de code C en assembleur
MOV Ax, a
MOV Ax, b
if: COMP AX, BX
	JNG else
	
	then: SUB CX, AX, BX
		 MOV BX, AX
		 JMP endif
	else: INC AX
		 SUB BX, AX
		 MOV CX, BX
	endif: NOP

//2)	Traduction de code C en assembleur

MOV AX, x
MOV BX, y
MOV CX, n
MOV DX, s

if: COMP AX, CX
	   JNE else
-	COMP BX, 0
	   JNG else
	DEC CX
	ADD DX, BX
	SUB DX, CX
	INC BX
	JMP endif
else: INC CX
	 SUB DX, AX
	 ADD DX, CX
	 DEC AX
endif:


// Exercice 2 1)Somme des n premiers nombre pairs
MOV AX, b
MOV CX, 0
MOV BX, 0
for : COMP CX, n
	JNG endfor
	if: COMP AX, b
		JNE else
		ADD BX, AX
		INC AX
		JMP for
	else: INC b
		JMP for
endfor:  MOV AX, BX

//2) Somme des carrés des nobres <= n
MOV CX, 0
MOV BX, 0
while: COMP CX, n
	JNG endwhile
	MOV AX, CX
	MUL AX
	ADD BX, AX
	INC CX
	JMP while
endwhile: MOV AX,BX

//3) operation pour les cas 2,4,6 et 8
	COMP AX,2
         JNE case2:
       ADD AX, AX
       MOV BX, AX
       DEC BX
       JMP endswitch
case2: COMP AX,4
         JNE case3:
        ADD AX, AX
        MOV BX, AX
        DEC BX
        JMP endswitch
case3: COMP AX,6
         JNE case4:
        ADD AX, AX
        MOV BX, AX
        DEC BX
        JMP endswitch
case4: COMP AX,8
         JNE case4:
        ADD AX, AX
        MOV BX, AX
        DEC BX
        JMP endswitch
endswitch:

//4) Calcul du maximum
MOV AX, A
MOV BX, B
if: COMP AX, BX
	JNG else
	JMP endif
else: MOV AX, BX
	JMP endif
endif:

// Exercice 4
//1) Version recursive du factoriel
PROC fact n:
MOV AX, n
egainst: COMP AX, 0
		JNE compare2
		MOV AX, 1
		ret
	compare2: COMP AX, 1
		JNE suite
		MOV AX, 1
		ret
	suite: DEC AX
		PUSH  AX
		CALL fact
		MOV BX, n
		MUL BX
		ret
		
// 2) calcule de x=2x-y+z chacun variable codé sur 4 octets
MOV AL, x
ADD AL, x
SUB AL, y
ADD AL, z
MOV x, AL

// 3) Traduire fonction en assembleur
calculer PROC dd x, dd y
MOV AX, x
MOV BX, y
while: COMP AX, BX
	    JE endwhile
	    if:  COMP AX, BX
	    	  JNGE else
	    	  SUB BX
	    	  JMP while
	    else:
	    	  SUB BX, AX
	    	  JMP while
endwhile: MOV x, AX
		MOV y, BX

// 4) Traduire bout de code en assembleur
// a)
MOV AX, k
CMP AX, 0
	JNE end
	MOV i, j
end: NOP

//b)
MOV AX, k
COMP AX, 0
JNE else
MOV i, j
JMP end
else: MOV i, AX
	JMP end
end: NOP

//c) 
if

//5) Fonction de la suite de fibonacci
fibonacci PROC n:
MOV AX, n
COMP AX, 1
	JG else
	MOV AX, 1
	ret
else: DEC AX
	 MOV BX, AX
	 MOV CX, AX
	 PUSH AX
	 CALL fibonacci
	 MOV BX, AX
	 MOV AX, CX
	 DEC AX
	 PUSH AX
	 CALL fibonacci
	 ADD AX,CX
	 ret

// EXERCICE 6
// 1) Calcule de maximum d'un tableau allant de [200h] à [400h]
MOV AX, [200h]
MOV BX, [200h]
for: COMP BX, [400h]
	JG endfor
	if: COMP AX, BX
		JGE else
		MOV AX, BX
		ADD BX, [1h]
		JMP for
	else: ADD BX, [1h]
		JMP for
endfor: NOP

// 2) Calcule du PGCD de [200h] et [201h] et mettre dans [202h] -> classic
MOV AX, [200h]
MOV BX, [201h]

while: COMP AX, 0
	     
		JNG else
		SUB AX, BX
		JMP for
	else: SUB BX, AX
		JMP for

COMP AX, 0
	JNE endfor
	MOV AX, BX
	JMP end
COMP BX, 0
	JNE endfor
		
endfor: COMP AX, 0
	JNE else
	MOV [202h], BX
	JMP end
	else3: MOV [202h], AX
		JMP end
end: NOP

// 2)' Calcule du PGCD de [200h] et [201h] et mettre dans [202h] avec la recursivité
pgcd PROC dd [200h] dd [201h]:
MOV AX, [200h]
MOV BX, [201h]
if:CMP BX, 0
 JNE else
 ret
else: CMP AX, 0
	JNE suite
	MOV AX, BX
	ret
suite:
	CMP AX, BX
	JNGE suite2
	 SUB AX, BX
	 PUSH AX
	 PUSH BX
	 CALL pgcd
	 ret
suite2: SUB BX, AX
	PUSH AX
	PUSH BX
	CALL pgcd
	ret
