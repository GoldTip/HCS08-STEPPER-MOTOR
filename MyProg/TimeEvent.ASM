; -----------------------------------------------------------------------------
;  PROGRAM:  TimeEvent   : PROCEDURE ATTIVATE DA EVENTI TEMPORALI  :        
; -----------------------------------------------------------------------------
;  PROJECT:              : 
; -----------------------------------------------------------------------------
; Inserisci qui le procedure a tempo chiamandole:
; TimerSvc.1ms; TimerSvc.10ms; TimerSvc.100ms; TimerSvc.1sec; TimerSvc.10sec
; TimerSvc.1min  a seconda del tempo che desideri.
; Al termine per ognuna di queste ricordati di inserire l'istruzione:  rts

	.CODE
		
; -----------------------------------------------------------------------------
; ----------------------- TASKS SERVICED EVERY  1 mS --------------------------
; -----------------------------------------------------------------------------
TimerSvc.1ms:
	
; -----------------------------------------------------------------------------
; ------------- DRIVER PER MOTORI PASSO PASSO BIPOLARI E UNIPOLARI ------------
; -----------------------------------------------------------------------------	
		
; la variabile speed determina la frequenza di clock di generazione delle fasi
; e quindi la velocita' del motore.  Valore minimo di speed = 5 -> 200Hz 
; Se il motore ha 200 step con 200Hz di clock la velocita' e': 1 giro al sec. 	
			
	DoEvery	speed,stpm.x	; Esegui proced. ogni speed volte
; -----------------------------------------------------------------------------
; ------------------------------------------- GENERAZIONE PHASE A -------------
; -----------------------------------------------------------------------------
stpm.A0:
; ------------------------------------------- VERIFICA DIREZIONE --------------
	brset	DIR,DIR_port,stpm.A1	; Rotazione Oraria o Antioraria
; ------------------------------------------- ROTAZIONE ORARIA ----------------
	brset	0,phase_A,*+3	; C <- Valore del primo bit
	ror	phase_A		; B0 <- Primo Bit  C <- Primo Bit
	bra	stpm.A2		
; ------------------------------------------- ROTAZIONE ANTIORARIA ------------
stpm.A1	brset	7,phase_A,*+3	; C <- Valore del primo bit
	rol	phase_A		; B0 <- Primo Bit  C <- Primo Bit
; ------------------------------------------- SETTA USCITA SECONDO CARRY ------
stpm.A2	bcc	stpm.A3		; Zero ?	
	bset	COIL_A,COIL_A_port	; No, Uno setta COIL_A alta
	bra	stpm.B0			
stpm.A3	bclr	COIL_A,COIL_A_port	; Si, Zero, setta COIL_A bassa

; -----------------------------------------------------------------------------
; ------------------------------------------- GENERAZIONE PHASE B -------------
; -----------------------------------------------------------------------------
stpm.B0:
; ------------------------------------------- VERIFICA DIREZIONE --------------
	brset	DIR,DIR_port,stpm.B1	
; ------------------------------------------- ROTAZIONE ORARIA ----------------
	brset	0,phase_B,*+3	
	ror	phase_B		
	bra	stpm.B2		
; ------------------------------------------- ROTAZIONE ANTIORARIA ------------
stpm.B1	brset	7,phase_B,*+3	
	rol	phase_B		
; ------------------------------------------- SETTA USCITA SECONDO CARRY ------
stpm.B2	bcc	stpm.B3		
	bset	COIL_B,COIL_B_port		
	bra	stpm.C0			
stpm.B3	bclr	COIL_B,COIL_B_port	

; -----------------------------------------------------------------------------
; ------------------------------------------- GENERAZIONE PHASE C -------------
; -----------------------------------------------------------------------------
stpm.C0:
; ------------------------------------------- VERIFICA DIREZIONE --------------
	brset	DIR,DIR_port,stpm.C1	
; ------------------------------------------- ROTAZIONE ORARIA ----------------
	brset	0,phase_C,*+3	
	ror	phase_C		
	bra	stpm.C2		
; ------------------------------------------- ROTAZIONE ANTIORARIA ------------
stpm.C1	brset	7,phase_C,*+3	
	rol	phase_C		
; ------------------------------------------- SETTA USCITA SECONDO CARRY ------
stpm.C2	bcc	stpm.C3		
	bset	COIL_C,COIL_C_port	
	bra	stpm.D0			
stpm.C3	bclr	COIL_C,COIL_C_port	

; -----------------------------------------------------------------------------
; ------------------------------------------- GENERAZIONE PHASE D -------------
; -----------------------------------------------------------------------------
stpm.D0:
; ------------------------------------------- VERIFICA DIREZIONE --------------
	brset	DIR,DIR_port,stpm.D1	
; ------------------------------------------- ROTAZIONE ORARIA ----------------
	brset	0,phase_D,*+3	
	ror	phase_D		
	bra	stpm.D2		
; ------------------------------------------- ROTAZIONE ANTIORARIA ------------
stpm.D1	brset	7,phase_D,*+3	
	rol	phase_D		
; ------------------------------------------- SETTA USCITA SECONDO CARRY ------
stpm.D2	bcc	stpm.D3		
	bset	COIL_D,COIL_D_port	
	bra	stpm.x			
stpm.D3	bclr	COIL_D,COIL_D_port

; -------------------------------------------- TERMINE CONTROLLO STEPPER MOTOR -	
stpm.x:

; Inserire qui altri eventi con base tempi di 1 ms

	rts


