(deftemplate arca
    (slot animal) 
    (slot gen))

(foreach ?animal (create$ soarece veverita pisica caine vaca elefant)
	(foreach ?gen (create$ masculin feminin)
		(assert (arca (animal ?animal)(gen ?gen)))
	)
)
(facts)
(run)

