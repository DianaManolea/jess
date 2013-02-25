(deftemplate elev
    (slot nume)
     (slot romana(type FLOAT))
     (slot biologie(type FLOAT))
    (slot mate(type FLOAT))
    (slot info(type FLOAT))
    (slot bac(type FLOAT))
    ;(multislot note(type INTEGER))
    )

;(assert(elev(nume Popoescu)(note 10 9 8 6 10)))
(assert (elev(nume Popescu)(romana 9.50)(biologie 5)(mate 7)(info 7)(bac 9.91)))
(assert (elev(nume Ghera)(romana 9.50)(biologie 5)(mate 8)(info 7)(bac 7.50)))
(assert (elev(nume Ionescu)(romana 7)(biologie 7)(mate 9)(info 9.30)(bac 9.40)))
(assert (elev(nume Bara)(romana 8)(biologie 10)(mate 8)(info 7)(bac 9.91)))

(facts)

(defrule facultate
    
   ; ?p <-(elev(mate ?a&:(> ?a 8)) (info ?b&:(> ?b 8)) )

    
    
	?uman  <- (elev    { romana > 9.0 && mate < 8.0 || romana == 10 }  )
    ?mate <- (elev    {  ((  bac >=  5.0) && (info >= 8.0) && (mate >=  8.0) && (biologie < 8))  || mate == 10 || info == 10}  )
    ?biologie <- (elev    { biologie >= 9.0 && mate >= 8.0 && romana <= 8.0 || biologie ==  10 }  )
=>
      
    
   ; (printout t  " -- Elevul " ?p.nume " va studia la facultati de matematica si informatica! " crlf)
 (printout t  " -- Elevul " ?mate.nume " va studia la facultati de matematica si informatica! " crlf)
(printout t  " -- Elevul " ?uman.nume " va studia la facultati umane avand o medie la romana de " ?uman.romana  crlf)
(printout t  " -- Elevul " ?biologie.nume " va studia la facultati biologie avand o medie la biologie de " ?biologie.biologie crlf)
    
    )

(run)