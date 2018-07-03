; -----------------------------------------------------------------------------
;  PROGRAM:  Boot        : ISTRUZIONI ESEGUITE SOLO AL BOOTSTRAP/RESET    
; -----------------------------------------------------------------------------
;  PROJECT:  StepMotor   : 
; -----------------------------------------------------------------------------
; Inserire qui le configurazioni iniziali e le macro di Inizializzazione
; -----------------------------------------------------------------------------
 
; ----------------------------------------- INIT FREQUENCY CAL PIN IF DEFINED -
	.ifdef FCPIN
	InitPin	FCPIN,OUT,LOW	; Pin FCPIN in uscita default low
	.endif 

	InitADC				; Inizializza il Modulo ADC

; ------------------------------------------ INIT USCITE BOBINE MOTORE --------
	InitPin	COIL_A,OUT,LOW
	InitPin	COIL_B,OUT,LOW	
	InitPin	COIL_C,OUT,LOW	
	InitPin	COIL_D,OUT,LOW
; ------------------------------------------ INIT DIREZIONE -------------------	
	InitPin	DIR,IN,LOW,PULLUP		
; ------------------------------------------ IMPOSTAZIONE DELLE FASI ----------
	mov	#%00110011,phase_A	; Imposta sequenza FASE A
	mov	#%11001100,phase_B	; Imposta sequenza FASE B
	mov	#%01100110,phase_C	; Imposta sequenza FASE C
	mov	#%10011001,phase_D	; Imposta sequenza FASE D	
							

			 					