.MODEL SMALL
.STACK 100H
.DATA
	OLD    DB &#39	;BUBSORT.ASM&#39;,0
	NEW    DB &#39	;BUBBLE.ASM&#39;,0
	SUCMSG DB &#39	;BUBSORT.ASM RENAMED AS BUBBLE.ASM&#39;,&#39;$&#39;
FAILMSG DB &#39;ERROR! BUBSORT.ASM COULD NOT BE RENAMED&#39;,&#39;$&#39;
.CODE
	MAIN:   
	        MOV AX,@DATA
	        MOV DS,AX
	        MOV ES,AX
	        LEA DX,OLD    	;DS:DX POINTS TO THE ASCIIZ STRING &#39;BUBSORT.ASM&#39;,0
	        LEA DI,NEW    	;ES:DI POINTS TO THE ASCIIZ STRING &#39;BUBBLE.ASM&#39;,0
	        MOV AH,56H    	;DOS FUNCTION 56H IS USED FOR RENAMING
	        INT 21H
	        JC  ERROR     	;IF THERE IS AN ERROR CARRY FLAG IS SET

	        LEA DX,SUCMSG
	        JMP DISPLAY
	ERROR:  
	        LEA DX,FAILMSG
	DISPLAY:
	        MOV AH,09H
	        INT 21H
	        MOV AH,4CH
	        INT 21H
ALIGN 16
END MAIN