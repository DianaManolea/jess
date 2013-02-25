(assert (patrulater 1 1 2 1 2 2 1 2))

(deffunction distance(?x1 ?y1 ?x2 ?y2)
    (printout t (sqrt (+ (*(- ?x2 ?x1) (- ?x2 ?x1)) (*(- ?y2 ?y1) (- ?y2 ?y1)))) crlf)
    (return (sqrt (+ (*(- ?x2 ?x1) (- ?x2 ?x1)) (*(- ?y2 ?y1) (- ?y2 ?y1)))))
    )
(deffunction perpendiculare (?x1 ?y1 ?x2 ?y2 ?x3 ?y3)
    (if (eq (+ (*(distance ?x1 ?y1 ?x2 ?y2) (distance ?x1 ?y1 ?x2 ?y2) )
           (*(distance ?x1 ?y1 ?x2 ?y2) (distance ?x1 ?y1 ?x2 ?y2) ) )
            (* (distance ?x3 ?y3 ?x1 ?y1) (distance ?x3 ?y3 ?x1 ?y1)))
        then
        (return 1))  
    ;(return 0) 
    
    )
(defrule laturi
    (patrulater ?x1 ?y1 ?x2 ?y2 ?x3 ?y3 ?x4 ?y4)
    =>
    (assert (l1 (distance ?x1 ?y1 ?x2 ?y2)))
    (assert (l2 (distance ?x2 ?y2 ?x3 ?y3)))
    (assert (l3 (distance ?x3 ?y3 ?x4 ?y4)))
    (assert (l4 (distance ?x4 ?y4 ?x1 ?y1)))
    (assert (unghidrept (perpendiculare ?x1 ?y1 ?x2 ?y2 ?x3 ?y3) ) )
    
    )

(defrule patrat
    (l1 ?x)
    (l2 ?x)
    (l3 ?x)
    (l4 ?x)
    (unghidrept 1)
    =>
    (printout t "Patrulaterul e patrat" crlf)
    )

(run)
(facts)