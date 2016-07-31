;//rcall -> Para que sirve  
;//DAW -> Para que sirve
;    // que es instruction overhead
    #include <P18F2550.INC>
    list p=PIC18F2550
    
    #define sa1l 0x60
    #define sa1h 0x00
    #define sad 0x0060 
  
    CBLOCK 0x60
    sa1, sa2, sa3
    ENDC
    
    org 0x0
main:
 movlw 0x05
 movwf sa1 
 movlw 0x04
 movwf sa2
 movlw 0x03
 movwf sa3 
 lfsr 1,sad   ;Load in FSR1 sad [0060h]
 movlw 0x89
 movwf INDF1  ;Load in FSR* 89h 	
 movlw 0x00
 movf sa1,W
 movf sa2,W
 movf sa3,W
 bra main
    
    END 