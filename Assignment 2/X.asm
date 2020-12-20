.MODEL SMALL
.STACK 100H
.DATA
	NUM1 DW 0009H
	NUM2 DW 0006H
	NUM3 DW 0003H
	RES  DW ?

.CODE
MAIN PROC
	       MOV  AX,@DATA
	       MOV  DS,AX
	       MOV  AX,NUM1
	       MOV  BX,NUM2
	L1:    
	       CMP  AX,BX
	       JE   OTHER
	       JB   EXCHG
	L2:    
	       MOV  DX,0H
	       DIV  BX
	       CMP  DX,0
	       JE   OTHER
	       MOV  AX,DX
	       JMP  L1
	EXCHG: 
	       XCHG AX,BX
	       JMP  L2
	EXCHG1:
	       XCHG AX,BX
	       JMP  L4
	OTHER: 
	       MOV  AX,NUM3
	L3:    
	       CMP  AX,BX
	       JE   EXIT
	       JB   EXCHG1
	L4:    
	       MOV  DX,0H
	       DIV  BX
	       CMP  DX,0
	       JE   EXIT
	       MOV  AX,DX
	       JMP  L3
	EXIT:  
	       MOV  RES,BX
	       MOV  AH,02
	       ADD  RES,30H
	       MOV  DX,RES
	       INT  21H
	       MOV  AH,4CH
	       INT  21H
  MAIN ENDP 
  END MAIN

END MAIN