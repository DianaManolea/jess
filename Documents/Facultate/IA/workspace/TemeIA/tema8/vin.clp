/*  Vinuri simple pentru mancaruri complicate. Vinuri complexe pentru mancaruri simple
Nu se serveste un vin dulceag intre doua vinuri (albe sau rosii) seci
Vinurile albe seci se dau inaintea celor rosii
Vinurile albe foarte dulci se servesc, in schimb, dupa cele rosii
Ordinea este intotdeauna crescatoare: mai intai vinurile slabe, apoi cele tari; mai intai vinul nou, apoi cel vechi
Vinurile tip sampanie sau spumante pot fi servite dupa sau inaintea celor nespumante, dar nu intre ele.
Spre finele pranzului se recomanda de servit un vin rosu. Sunt deasemenea recomandabile si vinurile licoroase.
Vinurile seci albe si rosii pot fi servite pe intreg parcursul pranzului, dar e mai bine de servit toata gama vinurilor. */
/*
;vin alb sec- peste moluste raci
;carne alba vitel miel porc vin rosu tare vechi
;carne pasare vanat vin suav
;ficat de rata sau gasca vin sec
;;
;;
;branza proaspata vin dulce alb rose
;branza capra vin alb sec , rosu tanar
; cascaval brie vin rosu tare
;desert vin licoros dulce natural
;*/


(deftemplate meniuTraditional 
    (slot carne)
    (slot branza) ; 
    (slot tipMasa);;mic-dejun, pranz, cina , desert
    )

(defrule startup
   =>
   (printout "Asignari "t ))

	(assert (meniuTraditional 
        (carne peste)
        (branza brie)
        (tipMasa pranz)
       ))
(assert (meniuTraditional 
        (carne miel)
        
       ))
(assert (meniuTraditional 
        (carne vitel)
        (tipMasa desert)
        
       ))
(assert (meniuTraditional 
        (carne ficat)
        (branza capra)
        
       ))
(assert (meniuTraditional 
        (carne pasareVanat)
        (branza proaspata)
        
       ))

(defrule rule1
    
?p <- (meniuTraditional    { carne == ficat ||  carne == peste || branza == capra } 
           )
=>
(printout t  "Meniul cu " ?p.carne " sau " ?p.branza " se va consuma cu un vin alb sec!"crlf))

(defrule rule2
    
?p <- (meniuTraditional    {  branza == proaspata } 
           )
=>
(printout t  "Meniul cu branza " ?p.branza " se va consuma cu un vin alb dulce!"crlf))

(defrule rule3
    
?p <- (meniuTraditional    { branza == brie } 
           )
=>
(printout t  "Meniul cu branza " ?p.branza " se va consuma cu un vin rosu tare!"crlf))

(defrule rule4
    
    
?p <- (meniuTraditional    { tipMasa == desert } 
           )
=>
(printout t  "Meniul se va consuma cu un vin licoros dulce deoarece masa este un " ?p.tipMasa crlf))

(run)



	