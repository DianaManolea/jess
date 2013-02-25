(deftemplate produs (slot nume) (slot pret)(slot cumparat (allowed-values TRUE FALSE)))

(deftemplate produsAlimentar extends produs (slot termenValabilitate))
(deftemplate produsNealimentar extends produs (slot producator))
(deftemplate produsSolid extends produsAlimentar (slot cantitate))
(deftemplate produsLichid extends produsAlimentar (slot cantitate))

(assert (produsSolid (nume branza)(pret 20)(termenValabilitate 29.11.2010)(cantitate 5)(cumparat FALSE)))
(assert (produsSolid (nume salam)(pret 44)(termenValabilitate 1.12.2010)(cantitate 3)(cumparat FALSE)))
(assert (produsLichid (nume cola)(pret 4)(termenValabilitate 29.11.2010)(cantitate 5)(cumparat FALSE)))
(assert (produsLichid (nume smantana)(pret 13)(termenValabilitate 29.11.2010)(cantitate 5)(cumparat FALSE)))
(assert (produsNealimentar (nume masina)(pret 14500)(producator Honda)))
(assert (produsNealimentar (nume roata)(pret 254)))

(deftemplate total (slot valoare))
(assert (total (valoare 0)))
(defrule pretTotal 
    	?id<-(produs (pret ?p))
		?idTotal<-(total(valoare ?v))
		=>
		(modify ?idTotal(valoare(+ ?p ?v)))
		(printout t "pret total:" ?v crlf)
)