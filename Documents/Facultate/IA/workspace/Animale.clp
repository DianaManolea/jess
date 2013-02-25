(deftemplate intrebare
     (slot stringIntrebare)
     (slot raspuns)
    )
(assert(intrebare(stringIntrebare " Este un animal mare? ")(raspuns nil)))

(defrule q1
    ?idf<-(intrebare(stringIntrebare " Este un animal mare? "))
   		=>
    (printout t "Este un animal mare? " crlf)
(bind ?rasp (read))
   (modify ?idf(raspuns ?rasp))
   (if(eq ?rasp NU)
        then
        (printout t "Mananca alune?" crlf)
        (bind ?rr (read))
        (assert(intrebare(stringIntrebare "Mananca soareci?")(raspuns ?rr)))
        else
        (printout t "Mananca soareci?"crlf))
        (bind ?rr (read))
        (assert(stringIntrebare  "Mananca alune?")(raspuns ?rrr))
        (retract ?idf)
    )
(defrule veverita
(intrebare (stringIntrebare "Mananca alune?")(raspuns DA))
	=>
(printout t "Animalul preferat este o veverita" crlf)
)
(run)