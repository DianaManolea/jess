(deftemplate produse (slot zi (allowed-values Luni Marti Miercuri Joi Vineri Sambata))
    (slot vandute) (slot comandate) (slot scadere (allowed-values FALSE TRUE))
    (slot crestere (allowed-values FALSE TRUE))
    (slot ziPrecedenta (allowed-values Luni Marti Miercuri Joi Vineri Sambata))
)
(deftemplate comanda (slot zi (allowed-values Luni Marti Miercuri Joi Vineri Sambata))
    (slot numar)
)
(deffacts tabel
    (comanda (zi Luni) (numar 30))
	(comanda (zi Marti) (numar 30))
    (comanda (zi Miercuri) (numar 30))
    (comanda (zi Joi) (numar 40))
    (comanda (zi Vineri) (numar 40))
    (comanda (zi Sambata) (numar 50))    
)

(reset)

(assert (produse (zi Luni) (vandute 28)))
(assert (produse (zi Marti) (vandute 25) (ziPrecedenta Luni)))
(assert (produse (zi Miercuri) (vandute 23) (ziPrecedenta Marti)))
(assert (produse (zi Joi) (vandute 25) (ziPrecedenta Miercuri)))
(assert (produse (zi Vineri) (vandute 26) (ziPrecedenta Joi)))
(assert (produse (zi Sambata) (vandute 27) (ziPrecedenta Vineri)))

(defrule comanda-tendinta-scadere
    ?id <- (produse (zi ?zi) (vandute ?nr) (ziPrecedenta ?ziP))
    (produse (zi ?ziP) (vandute ?nrP) (ziPrecedenta ?ziPP))
    (produse (zi ?ziPP) (vandute ?nrPP))
    (test (< ?nr ?nrP ?nrPP))
    (comanda (zi ?zi) (numar ?com))
    (comanda (zi ?ziP) (numar ?comP))
    (comanda (zi ?ziPP) (numar ?comPP))
    =>
    (bind ?difPP (- ?comPP ?nrPP))
    (bind ?difP (- ?comP ?nrP))
    (bind ?dif (- ?com ?nr))
    (modify ?id (scadere TRUE) (comandate (- ?com (round (/ (+ ?dif ?difP ?difPP) 3)))))
)
(defrule comanda-tendinta-crestere
    ?id <- (produse (zi ?zi) (vandute ?nr) (ziPrecedenta ?ziP))
    (produse (zi ?ziP) (vandute ?nrP) (ziPrecedenta ?ziPP))
    (produse (zi ?ziPP) (vandute ?nrPP))
    (test (> ?nr ?nrP ?nrPP))
    (comanda (zi ?zi) (numar ?com))
    (comanda (zi ?ziP) (numar ?comP))
    (comanda (zi ?ziPP) (numar ?comPP))
    =>
    (bind ?difPP (- ?comPP ?nrPP))
    (bind ?difP (- ?comP ?nrP))
    (bind ?dif (- ?com ?nr))
    (modify ?id (crestere TRUE) (comandate (+ ?com (round (/ (+ ?dif ?difP ?difPP) 3)))))
)
(defrule comanda
    ?id <- (produse (zi ?zi) (scadere FALSE) (crestere FALSE))
    (comanda (zi ?zi) (numar ?com))
    =>
	(modify ?id (comandate ?com))    
)
(run)
(defrule afisare
    (produse (zi ?zi) (comandate ?com))
    (comanda (zi ?zi) (numar ?nr))
    =>
	(printout t ?zi " ar fi trebuit sa se comande " ?nr " de produse, s-au comandat " ?com " de produse." crlf)    
)
(run)