(assert (faza hotaraste-continuarea))

(defrule reluare
    ?faza <- (faza hotaraste-continuarea)
    =>
    (retract ?faza)
    (printout t "Continuati?")
    (assert (raspuns (read)))
	)
(defrule while
    ?rasp <- (raspuns ?r&~da&~nu)
    =>
    (retract ?rasp)
    (printout t "Continuati?")
    (assert (raspuns (read)))
    )
(defrule if
    ?rasp <- (raspuns da)
    =>
    (retract ?rasp)
    (assert (faza continua))
    )
(defrule else
    ?rasp <- (raspuns nu)
    =>
    (retract ?rasp)
    (assert (faza oprire))
    )

(run)
(facts)