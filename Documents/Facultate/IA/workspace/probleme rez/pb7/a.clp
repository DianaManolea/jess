(deffacts multimi
	(multime A 1 2 3)
	(multime B 3 4 5 6))

(deffacts reuniune (reuniune AB))

(defrule descompunere
	(declare (salience 1000))
	?n <- (multime ?A ?p $?a)
	(test (not (eq ?p nil)))
	=>
	(retract ?n)
	(assert (element ?p))
	(assert (multime ?A $?a)))
	 
(defrule reuniune
	?n <- (element ?p)
	?m <- (reuniune ?A $?a)
	=>
	(retract ?m ?n)
	(assert (reuniune ?A ?p $?a)))