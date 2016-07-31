;//rcall -> Para que sirve  
;//DAW -> Para que sirve
;    // que es instruction overhead
#include <P18F2550.INC>
    list p=PIC18F2550
    
#define sa1l 0x61
#define sa1h 0x00
  
    CBLOCK 0x60
    sa1, sa2, sa3
    ENDC
    
    org 0
main:
 movlw 0x05
 movwf sa1 
 movlw 0x05
 movwf sa2
 movlw 0x05
 movwf sa3 
 movlw 0x60
 movwf FSR1L
 movlw 0x00
 movwf FSR1H
 movlw 0x89
 movwf INDF1
 movlw 0x00
 movf sa1,W
 movf sa2,W
 movf sa3,W
 bra main
    
    END 