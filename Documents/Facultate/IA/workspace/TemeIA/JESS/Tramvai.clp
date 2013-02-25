(deftemplate tramvai (slot loc) (slot energie(allowed-values TRUE FALSE)) (slot stare))

(assert (tramvai (loc garaj) (energie FALSE) (stare init)))

(defrule alimentareEnergie
    ?id<-(tramvai (stare init))
    =>
    (facts)
    (retract ?id)
    (assert (tramvai (energie TRUE)(loc garaj)(stare energizat)))
    (printout t "Tramvaiul e alimantat cu energie" crlf)
    (facts)
    )
(defrule pornit
    ?id<-(tramvai (stare energizat))
    =>
    (facts)
    (retract ?id)
    (assert (tramvai (energie TRUE)(loc garaj)(stare pornit)))
    (printout t "Tramvaiul e pornit" crlf)
    (facts)
    )
(defrule statie
    ?id<-(tramvai (stare pornit))
    =>
    (facts)
    (retract ?id)
    (assert (tramvai (energie TRUE)(loc drum)(stare pornit)))
    (printout t "Tramvaiul e in statie" crlf)
    (facts)
    )
(defrule semafor
    ?id<-(tramvai (stare pornit))
    =>
    (facts)
    (retract ?id)
    (assert (tramvai (energie TRUE)(loc drum)(stare pornit)))
    (printout t "Tramvaiul e la semafor" crlf)
    (facts)
    )
(defrule miscare
    ?id<-(tramvai (stare pornit))
    =>
    (facts)
    (retract ?id)
    (assert (tramvai (energie TRUE)(loc drum)(stare pornit)))
    (printout t "Tramvaiul e in msicare" crlf)
    (facts)
    )
(defrule final
    ?id<-(tramvai (stare pornit))
    =>
    (facts)
    (retract ?id)
    (assert (tramvai (energie FALSE)(loc garaj)(stare fin)))
    (printout t "Tramvaiul oprit" crlf)
    (facts)
    )
(run)