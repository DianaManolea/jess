(assert (suma 0))
(assert (elemente 1 2 3 4 5 6))

(defrule sumaelemente
    ?suma <- (suma ?s)
    ?elem <- (elemente $?e ?el)
    =>
    (retract ?suma ?elem)
    (assert(suma (+ ?s ?el)))
    (assert (elemente ?e))
    )

(run)
(facts)