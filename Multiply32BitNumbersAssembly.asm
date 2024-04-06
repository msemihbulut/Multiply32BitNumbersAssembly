PORTA EQU 110  ;kullanicidan input almak icin port belirlenir


ORG 100

basla:
            
    MOV WORD PTR [0200h],00261H   ;Carpan 0-16 bit
    MOV WORD PTR [0202h],00842H   ;Carpan 16-32 bit
    
    MOV WORD PTR [0204h],00104H   ;Carpilan 0-16 bit
    MOV WORD PTR [0206h],02079H   ;Carpilan 16-32 bit
    
    MOV SI,32       ;Dongu degiskeni     


dongu:

    MOV BX,[0200h]  ; Carpanin 0-16 bitini BX registerina atadik
    AND BX,01H 	    ; LSB haricindeki tum bitler sifirlanir
    XOR BX,01H	    ; LSB biti kontrol edilir
    JZ ekleme       ; LSB biti 1 ise Zero flag setlenir ve ekleme kismi calisir
    CLC	            ; LSB biti 0 ise Carry flagi 0'a setlenir


kaydirma:

    MOV AX,[0306h]
    RCR AX,1        ;Carpimin 64-48 bitini 1 saga kaydir
    MOV [0306h],AX
    
    MOV BX,[0304h]      
    RCR BX,1        ;Carpimin 48-32 bitini 1 saga kaydir
    MOV [0304h],BX
    
    MOV CX,[0302h]
    RCR CX,1        ;Carpimin 32-16 bitini 1 saga kaydir
    MOV [0302h],CX	
    
    MOV DX,[0300h]
    RCR DX,1        ;Carpimin 16-0 bitini 1 saga kaydir
    MOV [0300h],DX	  
    
    MOV AX,[0202h]
    SHR AX,1        ;Carpani 1 bit saga kaydir
    MOV [0202h],AX 
    
    MOV BX,[0200h]
    RCR BX,1        ;Carpani 1 bit saga kaydir ama carry ile birlikte
    MOV [0200h],BX 
       		
    DEC SI		    ;Dongu degiskeni azaltilir
    CMP SI,0	    ;Dongu degiskeni 0'a esit mi kontrol edilir	
    JNZ dongu	    ;Sifir degil ise isleme devam edilir
    JMP gosterme	;Sifir ise programi bitime kismi calistirilir 


ekleme: 
    
    MOV DX,[0204h]	;Carpilanin 0-16 biti DX registerina kopyalanir
    ADD [0304h],DX  ;Carpimin 32-48 bit araligina eklenir
    
    MOV DX,[0206h]  ;Carpilanin 16-32 biti DX registerina kopyalanir
    ADC [0306h],DX  ;Carpimin 32-48 bit araligina eklenir (carry onemli)
    
    JMP kaydirma    ;Ekleme isleminden sonra kaydirma kismina gecilir
    

gosterme:

   MOV DX, PORTA  ; DX = 110 oluyor 
   IN AL, DX      ; AL registerina DX registerindaki port degeri kullanilarak input aliniyor


giris1:
    CMP AL, 1       ;input degeri 1 mi kontrol ediliyor
    JNZ giris2      ;deger 1 degil ise diger kisima geciliyor
    MOV AX, [0300H] ;eger 1 ise AX registerina carpimin 0-16 bitinin tutuldugu bellek kismi kopyalaniyor
    OUT 199, AX     ;199 portuna AX degeri yansitiliyor
    JMP bitir       ;bitir kismina atlaniyor
    
    
    
giris2: 
    CMP AL, 2       ;input degeri 2 mi kontrol ediliyor
    JNZ giris3      ;deger 2 degil ise diger kisima geciliyor
    MOV AX, [0302H] ;eger 2 ise AX registerina carpimin 0-16 bitinin tutuldugu bellek kismi kopyalaniyor
    OUT 199, AX     ;199 portuna AX degeri yansitiliyor
    JMP bitir       ;bitir kismina atlaniyor
        
    
giris3:
    CMP AL, 3       ;input degeri 3 mi kontrol ediliyor
    JNZ giris4      ;deger 3 degil ise diger kisima geciliyor
    MOV AX, [0304H] ;eger 3 ise AX registerina carpimin 0-16 bitinin tutuldugu bellek kismi kopyalaniyor
    OUT 199, AX     ;199 portuna AX degeri yansitiliyor
    JMP bitir       ;bitir kismina atlaniyor


giris4:
    CMP AL, 4       ;input degeri 4 mi kontrol ediliyor
    JNZ bitir       ;deger 4 degil ise diger kisima geciliyor
    MOV AX, [0306H] ;eger 4 ise AX registerina carpimin 0-16 bitinin tutuldugu bellek kismi kopyalaniyor
    OUT 199, AX     ;199 portuna AX degeri yansitiliyor
    JMP bitir       ;bitir kismina atlaniyor
    
bitir: 
    HLT  ;program bitiriliyor

