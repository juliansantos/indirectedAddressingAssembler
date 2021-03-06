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
    
     db 0x87,0x78,45,0  ;Declaring data bytes 
     dw 0x1110	;Declare data words
     da "1234",0 ;Declare Data ASCII, '0' unlike db represents a null value 
     dt "abcd",0 ;Define table each caracter has an RETLW embeded / in PIC18 is
		 ;recommend using tblrd and tblwt intructions
  		 
     de "ABCD"	 ;Declare EEPROM data byte - this is the same that org  0xF00000   	 
     data "hello" ;Numeric and text data
	 	 
     
main:     
 movlw 0x05
 movwf sa1	    ;sa1=5
 movlw 0x04
 movwf sa2	    ;sa2=4
 movlw 0x03
 movwf sa3	    ;sa3=3
 
 lfsr 1,sad   ;Load in FSR1 sad [0060h]
 movlw 0x89
 movwf INDF1  ;Load in FSR* 89h => sa1=89	
 movlw 0x21
 movwf PREINC1 ;fsr1++ => sa2=21 {sa2=fsr1*}
 movlw 0x1	
 movwf PLUSW1 ; (fsr1+w)*=w {sa3=1}  //w=1 
 
 movf sa1,W
 movf sa2,W
 movf sa3,W
 bra main
    
    END 