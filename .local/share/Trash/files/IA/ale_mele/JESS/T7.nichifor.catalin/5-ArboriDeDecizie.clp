(deftemplate intrebare (slot intrebare) (slot raspuns))
(deftemplate raspuns (slot raspuns))

(assert (intrebare))

(defrule start
    (intrebare (intrebare nil))
    =>
    (printout t "Sunteti angajat pe perioada nedeterminata?(da/nu)" crlf)
    (bind ?r (read))
    (assert (intrebare (intrebare "Sunteti angajat pe perioada nedeterminata?") (raspuns ?r)))
)

(defrule varsta
    (intrebare (intrebare "Sunteti angajat pe perioada nedeterminata?") (raspuns da|DA|Da))
    =>
    (printout t "Ce varsta aveti?" crlf)
    (bind ?r (read))
    (assert (intrebare (intrebare "Ce varsta aveti?") (raspuns ?r)))
)

(defrule venit
    (intrebare (intrebare "Ce varsta aveti?") {raspuns > 21 && raspuns <= 50})
    =>
    (printout t "Ce venit aveti?" crlf)
    (bind ?r (read))
    (assert (intrebare (intrebare "Ce venit aveti?") (raspuns ?r)))
)

(defrule credit
    (intrebare (intrebare "Ce venit aveti?") {raspuns >= 15 && raspuns <= 20})
	=>
    (printout t "Puteti oferi un girant? (da/nu)" crlf)
    (bind ?r (read))
    (assert (intrebare (intrebare "Puteti oferi un girant?") (raspuns ?r)))
)

(defrule posibil
    (intrebare (intrebare "Ce venit aveti?") {raspuns > 20 && raspuns <= 30})
	=>
    (assert (raspuns (raspuns "Este posibil sa primiti un credit.")))
)

(defrule foartePosibil
    (intrebare (intrebare "Ce venit aveti?") {raspuns > 30})
	=>
    (assert (raspuns (raspuns "Este foarte posibil sa primiti un credit.")))
)

(defrule girant
    (intrebare (intrebare "Puteti oferi un girant?") (raspuns da|DA|Da))
	=>    
    (assert (raspuns (raspuns "Este posibil sa primiti un credit.")))
)

(defrule imposibil1
    (intrebare (intrebare "Sunteti angajat pe perioada nedeterminata?") (raspuns nu|NU|Nu))
	=>
    (assert (raspuns (raspuns "Este imposibil sa primiti un credit.")))  
)

(defrule imposibil2
    (intrebare (intrebare "Ce varsta aveti?") {raspuns <= 21 || raspuns > 50})
	=>
    (assert (raspuns (raspuns "Este imposibil sa primiti un credit.")))
)

(defrule imposibil3
    (intrebare (intrebare "Ce venit aveti?") {raspuns < 15})
	=>
    (assert (raspuns (raspuns "Este imposibil sa primiti un credit.")))  
)

(defrule imposibil4
    (intrebare (intrebare "Puteti oferi un girant?") (raspuns nu|NU|Nu))
	=>
    (assert (raspuns (raspuns "Este imposibil sa primiti un credit.")))  
)

(defrule raspuns
	(raspuns (raspuns ?r))
    =>
    (printout t ?r crlf)    
)
(run)