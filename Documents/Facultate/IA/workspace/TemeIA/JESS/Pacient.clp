(defglobal ?*PRIORITY* = 1)
(deftemplate Pacient (slot nume) (slot tuse(allowed-values TRUE FALSE)) (slot febra(allowed-values TRUE FALSE)))

(assert (Pacient (nume Doni) (tuse FALSE) (febra FALSE)))
(assert (Pacient (nume Catlen) (tuse FALSE) (febra TRUE)))
(assert (Pacient (nume Curva) (tuse TRUE) (febra TRUE)))
(assert (Pacient (nume Pascal) (tuse TRUE) (febra FALSE)))
(facts)

(defrule verySick
    (declare (salience ?*PRIORITY*))
    ?nume<- (Pacient (nume))
    ?tuse <- (Pacient (tuse))
    ?febra <- (Pacient (febra))
    =>
    ( (if (= tuse TRUE and = febra  TRUE)
            then (printout t "Pacientul e foarte bolnav!  " ?nume ?tuse ?febra crlf)
            )
        else (if (= tuse TRUE and = febra FALSE)
            then (printout t "Pacientul e destul de bolnav!  " ?nume ?tuse ?febra crlf)
            )
        else (if (= tuse FALSE and = febra TRUE)
            then (printout t "Pacientul e cam bolnav!  " ?nume ?tuse ?febra crlf)
            else
            (printout t "Pacientul ok!  " ?nume ?tuse ?febra crlf)
            )
        )
    )
(run)
