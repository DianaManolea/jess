(reset)

(deftemplate element
    (slot nume)
    (slot element))

(assert(element(nume A)(element 1)))
(assert(element(nume A)(element 2)))
(assert(element(nume A)(element 3)))
(assert(element(nume A)(element 5)))

(assert(element(nume B)(element 2)))
(assert(element(nume B)(element 4)))
(assert(element(nume B)(element 9)))

(defrule union
  	(element(nume ?n3)(element ?f))
    (element(nume ?n4)(element ?f))
	=>
  	(assert (element (nume ArB)(element ?f)))
)

(defrule conditie
    ?c<-(accumulate(bind ?suma 0)
        (bind ?suma (+ ?suma ?el))
        ?suma
        (element(nume ArB)(element ?el&:(> ?el 3))))
    =>
    (printout t ?c crlf)
    )

(run)
