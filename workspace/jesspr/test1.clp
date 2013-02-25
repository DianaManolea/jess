(reset) 

 ; define the counter
 (deftemplate counter (slot count (type integer) (default 0)))

 ; define the rule
 (defrule switchme
     ?p <- (counter {count < 10})
     =>
     (printout t ?p.count crlf)
    (bind ?p.count (+ ?p.count 1))
     )

 ; initialise counter
 (deffunction init ()
     (assert (counter (count 1)))
    )

 ;initialise program
 (init)

 ;run program
 (run)