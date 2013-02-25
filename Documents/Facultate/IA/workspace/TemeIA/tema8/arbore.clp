(deftemplate intrebare
	(slot stringIntrebare)
	(slot raspuns)
)

(deftemplate credit
    (multislot nume)
  
    )

(assert (credit ( nume nil)))
(assert (intrebare (stringIntrebare nil)(raspuns nil)))


(defrule q1
(intrebare (stringIntrebare nil)(raspuns nil))
=>
(printout t "Persoana are statut de somer/salariat ? (somer/salariat)" crlf)
(bind ?r (read))
(assert (intrebare (stringIntrebare "statut")(raspuns ?r)))
)
(defrule somer
(intrebare (stringIntrebare "statut")(raspuns somer))
=>
    (assert(credit(nume Credit pentru someri)))
    (printout t "Nu acordam credit pentru someri. hahahahahha" crlf)
    
)

(defrule q2
(intrebare (stringIntrebare "statut")(raspuns salariat))
=>
(printout t " Are salariu mai mare sau mai mic ca 1000 lei? (mare/mic)" crlf)
(bind ?r (read))
(assert (intrebare (stringIntrebare "venit")(raspuns ?r)))
)

(defrule q3
(intrebare (stringIntrebare "venit")(raspuns mic))
=>
(printout t " Care este starea civila ? (casatorit/necasatori)" crlf)
(bind ?r (read))
(assert (intrebare (stringIntrebare "civila")(raspuns ?r)))
    
)

(defrule casatorit
(intrebare (stringIntrebare "civila")(raspuns casatorit))
=>
    (assert(credit(nume Credit salariu mic pentru casatoriti)))
    (printout t "Credit salariu mic pentru casatoriti" crlf)
)

(defrule necasatorit
(intrebare (stringIntrebare "civila")(raspuns necasatorit))
=>
    (assert(credit(nume Credit salariu mic pentru necasatoriti)))
    (printout t "Credit salariu mic pentru necasatoriti" crlf)

)


(defrule q4
(intrebare (stringIntrebare "venit")(raspuns mare))
=>
(assert (credit (nume Creditul cel mai mare)))
    (printout t "Creditul maxim posibil" crlf)
    
)



(run)
;(facts)