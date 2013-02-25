(assert (faza hotaraste-continuarea))

(defrule reluare
    ?faza <- (faza hotaraste-continuarea)
    =>
    (retract ?faza)
    (printout t "Continuati?")
    (bind ?raspuns (read))
    (while (and (neq ?raspuns da) (neq ?raspuns nu)) do
        (printout t "Continuati?") (bind ?raspuns (read)))
    (if (eq ?raspuns da) then (assert (faza continua)) else (assert (faza oprire)))
    
    )

(run)
(facts)