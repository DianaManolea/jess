(deffacts solutie (sol "blimp"))

(defrule non-ako
        (sol ?a)
        ?n <- (relat (mode ?m) (son ?a) (parent ?p))
        (test (not (eq "ako" ?m)))
        =>
        (retract ?n)
        (printout t ?a " " ?m " " ?p crlf))

