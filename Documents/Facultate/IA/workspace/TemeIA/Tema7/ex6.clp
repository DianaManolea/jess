(deftemplate mat
    (slot material))

(deftemplate tipIncendiu
    (slot nume)
    (slot material))

(deftemplate extinctor
    (multislot instumente)
  )



(assert(mat(material lemn)))
(assert(mat(material hartie)))
(assert(mat(material petrol)))
(assert(mat(material electronice)))
(assert(mat(material metale)))

(defrule tA
    ;(test(or((eq material hartie)(eq material lemn)))) 
        ;?p <-(mat (material ?a&:(eq ?a hartie)))
     ?p <-(mat { material == hartie || material == lemn }(material ?m))
    
    =>
    (printout t " Incendiu de tipul A cauzat de " ?m  " "  crlf)
    (assert(tipIncendiu(nume A)(material ?m)))
    )

(defrule tB
    ;(test(or((eq material hartie)(eq material lemn)))) 
        ?p <-(mat (material ?a&:(eq ?a petrol)))
    =>
    (printout t " Incendiu de tipul B cauzat de " ?a  " "  crlf)
    (assert(tipIncendiu(nume B)(material ?a)))
    )

(defrule tC
    ;(test(or((eq material hartie)(eq material lemn)))) 
        ?p <-(mat (material ?a&:(eq ?a electronice)))
    =>
    (printout t " Incendiu de tipul C cauzat de " ?a  " "  crlf)
    (assert(tipIncendiu(nume C)(material ?a)))
    )

(defrule tD
    ;(test(or((eq material hartie)(eq material lemn)))) 
        ?p <-(mat (material ?a&:(eq ?a metale)))
    =>
    (printout t " Incendiu de tipul D cauzat de " ?a  " "  crlf)
    (assert(tipIncendiu(nume D)(material ?a)))
    )

(defrule extinctorA
    ?p <-(tipIncendiu (nume ?a&:(eq ?a A)))
    
    =>
    
    (printout t " Incendiul de tipul " ?a "se stinge cu "  " apa sau solutii lichide bazate pe apa, sau solutii chimice de uscare " crlf)
    
    )

(defrule extinctorB
    ?p <-(tipIncendiu (nume ?a&:(eq ?a B)))
    
    =>
    
    (printout t " Incendiul de tipul " ?a "se stinge cu "  " substante chimice de uscare, dioxid de carbon, spuma " crlf)
    
    )

(defrule extinctorC
    ?p <-(tipIncendiu (nume ?a&:(eq ?a C)))
    
    =>
    
    (printout t " Incendiul de tipul " ?a "se stinge cu "  " agent nonconductor de electricitate " crlf)
    
    )

(defrule extinctorD
    ?p <-(tipIncendiu (nume ?a&:(eq ?a D)))
    
    =>
    
    (printout t " Incendiul de tipul " ?a "se stinge cu "  " pulberi de oxizi de bor si cocs ecranat. " crlf)
    
    )




(run)
(facts)