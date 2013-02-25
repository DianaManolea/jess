;;tranzitiile vor fi reprezentate cu ajutorul regulilor,
;; iar starile prin fapte.

(deftemplate tramvai
(slot motor (allowed-values TRUE FALSE))
(slot frana (allowed-values TRUE FALSE))
(slot viteza (allowed-values TRUE FALSE));;oprireStatie
(slot open (allowed-values TRUE FALSE));;deschideUsa
(slot close(allowed-values TRUE FALSE));;inchideUsa
(slot stare)
)

;;stari garaj(i) ---> pornire ---> stationare ---> semafor ---> garaj(f)
(assert (tramvai (motor FALSE)(frana FALSE)(viteza FALSE)(open FALSE)(close FALSE)(stare init)))


(defrule punereInFunctiune
    ?id <- (tramvai (stare init))
=>
    ;(facts)
	(retract ?id)
    (assert (tramvai (motor TRUE)(frana FALSE)(viteza FALSE)(open FALSE)(close TRUE)(stare punereInFunctiune)))
    (printout t " Tramvaiul si-a pornit motorul ! " crlf)
    
    )

(defrule pornire
    ?id <- (tramvai (stare punereInFunctiune))
=>
    ;(facts)
	(retract ?id)
    (assert (tramvai (motor TRUE)(frana FALSE)(viteza TRUE)(open FALSE)(close TRUE)(stare pornire)))
    (printout t " Tramvaiul a pornit! " crlf)
    
    )

(defrule stationare
    ?id <- (tramvai (stare pornire))
=>
    ;(facts)
	(retract ?id)
    (assert (tramvai (motor TRUE)(frana TRUE)(viteza FALSE)(open TRUE)(close FALSE)(stare stationare)))
    (printout t " Tramvaiul a stationat! " crlf)
    
    )

(defrule pornire2
    ?id <- (tramvai (stare stationare))
=>
    ;(facts)
	(retract ?id)
    (assert (tramvai (motor TRUE)(frana FALSE)(viteza TRUE)(open FALSE)(close TRUE)(stare pornire2)))
    (printout t " Tramvaiul a pornit dupa stationare ! " crlf)
    
    )

(defrule semafor
    ?id <- (tramvai (stare pornire2))
=>
    ;(facts)
	(retract ?id)
    (assert (tramvai (motor TRUE)(frana TRUE)(viteza FALSE)(open FALSE)(close TRUE)(stare semafor)))
    (printout t " Tramvaiul este la semafor ! " crlf)
    
    )

(defrule pornire3
    ?id <- (tramvai (stare semafor))
=>
    ;(facts)
	(retract ?id)
    (assert (tramvai (motor TRUE)(frana FALSE)(viteza TRUE)(open FALSE)(close TRUE)(stare pornire3)))
    (printout t " Tramvaiul a pornit dupa semafor ! " crlf)
    
    )




(defrule finalizareCiclu
?id<-(tramvai (stare pornire3))
=>
;(facts)
(retract ?id)
(assert (tramvai (motor FALSE)(frana TRUE)(viteza FALSE)(open FALSE)(close TRUE)(stare FINALA)))
(printout t " Tramvaiul a ajuns din nou in garaj!  " 
        ;c(facts)
))

(run)