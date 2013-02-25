(deftemplate multime (declare (ordered TRUE)))
(deftemplate reuniune (declare (ordered TRUE)))

(assert (multime A 1 2 3 4 5 6))
(assert (multime B 6 7 8 9 5 10 -1))
(assert (reuniune))

(defrule reuniuneA
    (declare (salience 0))
    ?id<-(multime A ?el $?rest)
    ?id2<-(reuniune $?re)
    =>
    (retract ?id)
    (retract ?id2)
    (assert (multime A ?rest))
    (assert (reuniune ?re ?el)))
(defrule reuniuneB
    (declare (salience -1))
    ?id<-(multime B ?el $?rest)
    ?id2<-(reuniune $?re)
    =>
    (retract ?id)
    (retract ?id2)
    (assert (multime B ?rest))
    (assert (reuniune ?re ?el)))
(defrule elimina
    (declare (salience 1))
    (multime A ?el $?rest)
    ?id<-(multime B $?in ?el $?du)
    =>
    (retract ?id)
    (assert (multime B ?in ?du)))
(facts)
(run)
(facts)