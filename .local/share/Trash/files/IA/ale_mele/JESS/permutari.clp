(assert (item 1 2 3 4))

(defrule permutari
	(item $?in ?x ?y $?du)
	=> 
    (assert (item $?in ?y ?x $?du))
    )
(run)
(facts)