
_main:

;code.c,11 :: 		void main() {
;code.c,15 :: 		ADCon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;code.c,16 :: 		Trisb =0x00;
	CLRF       TRISB+0
;code.c,17 :: 		Trisc=0b00000000;
	CLRF       TRISC+0
;code.c,18 :: 		Trisd=0;
	CLRF       TRISD+0
;code.c,19 :: 		trisa=255;
	MOVLW      255
	MOVWF      TRISA+0
;code.c,24 :: 		Portc=Portb=portd=0b00000000;
	CLRF       PORTD+0
	MOVF       PORTD+0, 0
	MOVWF      PORTB+0
	MOVF       PORTB+0, 0
	MOVWF      PORTC+0
;code.c,26 :: 		portd.b4=1;
	BSF        PORTD+0, 4
;code.c,32 :: 		if(porta.b4==0)
	BTFSC      PORTA+0, 4
	GOTO       L_main0
;code.c,34 :: 		goto loop1;
	GOTO       ___main_loop1
;code.c,35 :: 		}
L_main0:
;code.c,39 :: 		else  if(porta.b4==1)
	BTFSS      PORTA+0, 4
	GOTO       L_main2
;code.c,41 :: 		goto loop2;
	GOTO       ___main_loop2
;code.c,42 :: 		}
L_main2:
;code.c,47 :: 		loop1:
___main_loop1:
;code.c,49 :: 		for(;;)
L_main3:
;code.c,53 :: 		for(counter=23;counter>=1;counter--)
	MOVLW      23
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main6:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      1
	SUBWF      _counter+0, 0
L__main47:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;code.c,58 :: 		portc=counter%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;code.c,60 :: 		portb=counter/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;code.c,62 :: 		portd.b0=1;//Red1 on
	BSF        PORTD+0, 0
;code.c,64 :: 		portd.b7=1;//Green 2 on
	BSF        PORTD+0, 7
;code.c,66 :: 		portd.b6=0; //Yellow 2off
	BCF        PORTD+0, 6
;code.c,68 :: 		if(counter==3||counter==2||counter==1)
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      3
	XORWF      _counter+0, 0
L__main48:
	BTFSC      STATUS+0, 2
	GOTO       L__main45
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      2
	XORWF      _counter+0, 0
L__main49:
	BTFSC      STATUS+0, 2
	GOTO       L__main45
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      1
	XORWF      _counter+0, 0
L__main50:
	BTFSC      STATUS+0, 2
	GOTO       L__main45
	GOTO       L_main11
L__main45:
;code.c,71 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;code.c,73 :: 		portd.b6=1;
	BSF        PORTD+0, 6
;code.c,74 :: 		}
L_main11:
;code.c,76 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;code.c,53 :: 		for(counter=23;counter>=1;counter--)
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;code.c,77 :: 		}
	GOTO       L_main6
L_main7:
;code.c,79 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;code.c,80 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;code.c,81 :: 		portd.b6=0;
	BCF        PORTD+0, 6
;code.c,84 :: 		for(i=15;i>=1;i--)
	MOVLW      15
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main13:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      1
	SUBWF      _i+0, 0
L__main51:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;code.c,87 :: 		portc=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;code.c,89 :: 		portb=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;code.c,91 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;code.c,93 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;code.c,95 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;code.c,96 :: 		if(i==3||i==2||i==1)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      3
	XORWF      _i+0, 0
L__main52:
	BTFSC      STATUS+0, 2
	GOTO       L__main44
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      2
	XORWF      _i+0, 0
L__main53:
	BTFSC      STATUS+0, 2
	GOTO       L__main44
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      1
	XORWF      _i+0, 0
L__main54:
	BTFSC      STATUS+0, 2
	GOTO       L__main44
	GOTO       L_main18
L__main44:
;code.c,99 :: 		portd.b1=1;
	BSF        PORTD+0, 1
;code.c,100 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;code.c,102 :: 		}
L_main18:
;code.c,104 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;code.c,84 :: 		for(i=15;i>=1;i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;code.c,110 :: 		}
	GOTO       L_main13
L_main14:
;code.c,112 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;code.c,113 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;code.c,114 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;code.c,115 :: 		}
	GOTO       L_main3
;code.c,121 :: 		loop2:
___main_loop2:
;code.c,124 :: 		if(porta.b1==1)
	BTFSS      PORTA+0, 1
	GOTO       L_main20
;code.c,126 :: 		for(;;)
L_main21:
;code.c,130 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;code.c,132 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;code.c,134 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
;code.c,136 :: 		portc=0;
	CLRF       PORTC+0
;code.c,138 :: 		for(counter=3;counter>=1;counter--)
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main25:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      1
	SUBWF      _counter+0, 0
L__main55:
	BTFSS      STATUS+0, 0
	GOTO       L_main26
;code.c,142 :: 		portc=counter;
	MOVF       _counter+0, 0
	MOVWF      PORTC+0
;code.c,144 :: 		portd.b1=1;
	BSF        PORTD+0, 1
;code.c,146 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;code.c,148 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
	NOP
;code.c,138 :: 		for(counter=3;counter>=1;counter--)
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;code.c,152 :: 		}
	GOTO       L_main25
L_main26:
;code.c,155 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
;code.c,157 :: 		portc=0;
	CLRF       PORTC+0
;code.c,159 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;code.c,161 :: 		portd.b0=1;
	BSF        PORTD+0, 0
;code.c,163 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
;code.c,164 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;code.c,165 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;code.c,167 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
;code.c,169 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;code.c,170 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;code.c,175 :: 		}
	GOTO       L_main21
;code.c,176 :: 		}
L_main20:
;code.c,178 :: 		if(porta.b1==0)
	BTFSC      PORTA+0, 1
	GOTO       L_main32
;code.c,180 :: 		for(;;)
L_main33:
;code.c,183 :: 		portd.b0=1;
	BSF        PORTD+0, 0
;code.c,185 :: 		portd.b7=1;
	BSF        PORTD+0, 7
;code.c,187 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
;code.c,189 :: 		for(counter=3;counter>=1;counter--)
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main37:
	MOVLW      128
	XORWF      _counter+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      1
	SUBWF      _counter+0, 0
L__main56:
	BTFSS      STATUS+0, 0
	GOTO       L_main38
;code.c,193 :: 		portc=counter;
	MOVF       _counter+0, 0
	MOVWF      PORTC+0
;code.c,195 :: 		portd.b6=1;
	BSF        PORTD+0, 6
;code.c,197 :: 		portd.b7=0;
	BCF        PORTD+0, 7
;code.c,199 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	NOP
;code.c,189 :: 		for(counter=3;counter>=1;counter--)
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;code.c,203 :: 		}
	GOTO       L_main37
L_main38:
;code.c,206 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
;code.c,208 :: 		portc=0;
	CLRF       PORTC+0
;code.c,210 :: 		portd.b6=0;
	BCF        PORTD+0, 6
;code.c,212 :: 		portd.b5=1;
	BSF        PORTD+0, 5
;code.c,214 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	DECFSZ     R11+0, 1
	GOTO       L_main42
;code.c,215 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;code.c,216 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;code.c,218 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	DECFSZ     R11+0, 1
	GOTO       L_main43
	NOP
;code.c,220 :: 		portd.b5=0;
	BCF        PORTD+0, 5
;code.c,221 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;code.c,226 :: 		}
	GOTO       L_main33
;code.c,228 :: 		}
L_main32:
;code.c,447 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
