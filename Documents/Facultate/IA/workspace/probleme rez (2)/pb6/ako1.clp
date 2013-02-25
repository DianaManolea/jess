(defrule cauta-solutie-is-a
        (declare (salience 1000))
        (sol ?a)
        ?m <- (relat (mode "is-a") (son ?a) (parent ?q))
        ?n <- (relat (mode "ako") (son ?q) (parent ?p))
        =>
        (assert (parinte ?p))
        (retract ?m ?n))

(defrule cauta-solutie
        (declare (salience 1000))
        (sol ?a)
        ?v <- (relat (mode "ako") (son ?a) (parent ?p))
        =>
        (assert (parinte ?p))
        (retract ?v))

(defrule parinte-de-parinte
        (declare (salience 999))
        (parinte ?p)
        ?v <- (relat (mode "ako") (son ?p) (parent ?q))
        =>
        (retract ?v)
        (assert (parinte ?q)))

(defrule printeaza-solutie
        (declare (salience -1000))
        ?n <- (parinte ?p)
        =>
        (printout t ?p crlf)
        (retract ?n))

