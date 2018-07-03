; -----------------------------------------------------------------------------
;  PROGRAM: Setting/Define :  Impostazioni Progetto        
; -----------------------------------------------------------------------------
;  PROJECT:                :  
; -----------------------------------------------------------------------------
; Usa 'Setting' per definire opzioni di progetto
; Usa 'Define'  per definire valori costanti di progetto

; -----------------------------------------------------------------------------
; ----------------------------------------- OPZIONI MICROCONTROLLORE ----------
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------

; Bus Frequency 21504000 MHz  FTRIM = $91	Tcycle = 9216000	

	Setting	MCU_TYPE,MC9S08SH8  ; Definisce tipo di Microcontrollore
	Setting   WATCHDOG,OFF          	; Abilita il watch dog	
             Define  	fbus,9216000	; Definisce la frequenza di Bus.
             Define  	TRIMICS,$91	; Definisce la correzione per ICS
	DefinePin PTC1,FCPIN	; Definisce il Pin per Freq.Calib.
	Setting	PIT,MTIM	; Definisce la sorgente del PIT

; -----------------------------------------------------------------------------
; ------------------------------------------ ANALOG I/O PIN DEFINITION --------
; -----------------------------------------------------------------------------
	DefinePin ADP,1,TRIMMER	; Trimmer Analog Input su Canale 0
; -----------------------------------------------------------------------------
; ------------------------------------------ USCITE CONTROLLO BOBINE MOTORE ---
; -----------------------------------------------------------------------------
	DefinePin	PTB0,COIL_A	
	DefinePin	PTB1,COIL_B
	DefinePin	PTB2,COIL_C	
	DefinePin	PTB3,COIL_D
; ------------------------------------------  CONTROLLO DIREZIONE MOTORE ------	
	DefinePin	PTA5,DIR	
			