(deftemplate tipIncendiu (slot nume) (slot material))
(deftemplate extinctor (slot ext))
(deftemplate material(slot materiial))

(assert (material (materiial lemn)))
(assert (material (materiial hartie)))
(assert (material (materiial petrol)))
(assert (material (materiial electronice)))
(assert (material (materiial metale)))

(defrule tipA
    ?i <-(material { materiial == hartie || materiial == lemn }(materiial ?m))
    => 
    (assert(tipIncendiu(nume A)(material ?m)))
    (printout t " Incendiu de tipul A cauzat de " ?m  " "  crlf)
    )

(defrule tipB
    ?i <-(material ( materiial ?m & :(eq ?m petrol)))
    =>
    (assert(tipIncendiu(nume B)(material ?m)))
    (printout t " Incendiu de tipul B cauzat de " ?m  " "  crlf)  
    )

(defrule tipC
    ?i <-(material ( materiial ?m & :(eq ?m electronice)))
    =>
    (assert(tipIncendiu(nume C)(material ?m)))
    (printout t " Incendiu de tipul C cauzat de " ?m  " "  crlf)
    )

(defrule tipD
    ?i <-(material ( materiial ?m & :(eq ?m lemn)))
    =>
    (assert(tipIncendiu(nume D)(material ?m)))
    (printout t " Incendiu de tipul D cauzat de " ?m  " "  crlf) 
    )

(defrule extinctorA
    ?i <-(tipIncendiu (nume ?m & :(eq ?m A)))   
    =>   
    (printout t " Incendiul de tipul " ?m "se stinge cu apa sau solutii lichide bazate pe apa, sau solutii chimice de uscare " crlf)    
    )

(defrule extinctorB
    ?i <-(tipIncendiu (nume ?m & :(eq ?m B)))   
    =>   
    (printout t " Incendiul de tipul " ?m "se stinge cu substante chimice de uscare, dioxid de carbon, spuma " crlf)    
    )

(defrule extinctorC
    ?i <-(tipIncendiu (nume ?m & :(eq ?m C)))   
    =>   
    (printout t " Incendiul de tipul " ?m "se stinge cu agent nonconductor de electricitate " crlf)    
    )

(defrule extinctorD
    ?i <-(tipIncendiu (nume ?m & :(eq ?m D)))   
    =>   
    (printout t " Incendiul de tipul " ?m "se stinge cu apa  pulberi de oxizi de bor si cocs ecranat. " crlf)    
    )