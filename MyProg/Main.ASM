; -----------------------------------------------------------------------------
;  PROGRAM : Main        : ISTRUZIONI ESEGUITE CICLICAMENTE    
; -----------------------------------------------------------------------------
;  PROJECT : StepMotor   : Pilotaggio di un motore Passo Passo Unipolare/Bipol.
; -----------------------------------------------------------------------------
;  TARGET  : BOARD-SH8 : 
; -----------------------------------------------------------------------------
; AUTORE : Rech Marzio                        DATA: 25.05.2017 REV.: 18.02.2018
; -----------------------------------------------------------------------------
; FUNZIONE: Firmware per il controllo delle fasi di un motore passo passo 
; del tipo unipolare o bipolare. Il Firmware e' lo stesso per i 2 tipi.

; L'Hardware e' lo stesso per entrambe le tipologie Bipolare/Unipolare se viene
; usato come driver un Ponte H quadruplo pilotato come  l' IC L293D.

; Se si usa solo la configurazione Unipolare, si puo' usare come driver degli
; avvolgimenti del motore, 4 BJT controllati dalle linee PTB0..PTB3
; In questo caso i collettori dei BJT sono collegati agli avvolgimenti
; del motore. Il Comune degli avvolgimenti e' collegato a + 6V.

; Se viene usato il Driver L293D
; Se il motore e' Unipolare, si collegano i 4 capi dgli avvolgimenti
; alle uscite 1Y,2Y,3Y,4Y. scambiare i capi se il motore vibra e non ruota.

; Se il motore e' Bipolare
; Gli avvolgimenti delle 2 bobine dello motore passo passo sono collegate
; rispettivamente: COIL1 alle uscite 1Y e 2Y del LM293
;                  COIL2 alle uscite 3Y e 4Y del LM293


; Tutta la gestione viene fatta net TimeEvent con base tempi di 1 ms.
; E' possibile controlare la velocit… tramite TRIMMER sfruttando il Canale ADP0
; dell'ADC. La Linea PTA5 controlla il verso di rotazione.
; Tutte le variabili sono monitorate su NoICE.


; -----------------------------------------------------------------------------
main:	
	nop	
	Delay	100
								
; -----------------------------------------------------------------------------
; ------------ ACQUISIZIONE VALORE TRIMMER E AGGIUSTAMENTO SCALA --------------
; -----------------------------------------------------------------------------
	GetADC		TRIMMER,adcount,N	; adcount <- ADC sul canale ADP0
	
	IntScaleAdjust	adcount,255,250,5,speed	

	jmp	main
		

										