; -----------------------------------------------------------------------------
;  PROGRAM: Modules    :  Moduli di Libreria o file da includere  
; -----------------------------------------------------------------------------
;  PROJECT: TLED4PB2   : 
; -----------------------------------------------------------------------------
; ---------------------------------------------- MODULI LIBRERIA SPECIFICI ----
; -----------------------------------------------------------------------------
            .CODE 
; Inserisci qui sotto i files di moduli,driver o API da includere nel programma.
; Usa le Funzioni: LoadLibModule  LoadLibDriver  LoadLibApi
; o la direttiva: .include  Path\Filename

; ----------------------------------------- DRIVERS ---------------------------                           
	LoadLibModule ADC	
                 ConfigADC    8BIT,4	
				