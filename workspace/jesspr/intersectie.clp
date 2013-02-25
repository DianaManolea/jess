(deftemplate multime (declare (ordered TRUE)))
(deftemplate intersectie (declare (ordered TRUE)))
(deftemplate cardinal (declare (ordered TRUE)))

(assert (multime A 1 2 3 4 5 6 25 21))
(assert (multime B 6 7 8 9 5 10 -1))
(assert (intersectie))
(assert (cardinal 0))

(defrule elimina
    ?id<-(multime A $?ina ?el $?rest)
    (multime B $?in ?el $?du)
    ?id2<-(intersectie $?ceva)
    =>
    (retract ?id ?id2)
    (assert (intersectie ?ceva ?el))
    (assert (multime A ?ina ?rest)))
(defrule cardinal
    ?ci<-(cardinal ?c)
    ?id<-(intersectie ?el $?rest)
    =>
    (retract ?ci ?id)
    (assert (intersectie ?rest) (cardinal (+ ?c 1))))
(facts)
(run)
(facts)