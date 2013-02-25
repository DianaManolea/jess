(reset)

(deftemplate element
    (slot nume)
    (slot element))

(deftemplate cardinal
    (slot valoare))

(assert(element(nume A)(element 3)))
(assert(element(nume A)(element 62)))
(assert(element(nume A)(element 4)))
(assert(element(nume A)(element 10)))

(assert(element(nume B)(element 2)))
(assert(element(nume B)(element 3)))
(assert(element(nume B)(element 4)))

(defrule inters
    (element(nume ?n1)(element ?e))
    (element(nume ?n2 & ~?n1)(element ?e))
    =>
    (assert(element(nume AiB)(element ?e)))
    )


(defrule cardial
    ?c<-(accumulate(bind ?card 0)
    	(bind ?card (+ ?card 1))
    	?card
        (element(nume AiB))       
    )    
    =>
    (printout t (?c toString) crlf)  
    )

(run)