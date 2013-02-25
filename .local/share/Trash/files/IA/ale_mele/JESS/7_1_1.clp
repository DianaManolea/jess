(deftemplate IS-A (slot lhs) (slot rhs))
(deftemplate Has-shape (slot lhs) (slot rhs))
(deftemplate AKO (slot lhs) (slot rhs))

(deffacts retea-semantica
    (IS-A (lhs GoodYear) (rhs blimp))
    (IS-A (lhs SpiritOfStL) (rhs specia1))
    (IS-A (lhs AirForce1) (rhs DC-9))
    (AKO (lhs blimp) (rhs Pr.driven))
	(AKO (lhs blimp) (rhs ballon))
	(Has-shape (lhs blimp) (rhs Ellips))    
    (AKO (lhs specia1) (rhs Pr.driven)) 
    (AKO (lhs DC-3) (rhs Pr.driven))
    (AKO (lhs DC-9) (rhs jet))
	(AKO (lhs Concorde) (rhs jet))   
	(Has-shape (lhs ballon) (rhs round))
    (AKO (lhs ballon) (rhs Air-craft))
    (AKO (lhs Pr.driven) (rhs Air-craft))
    (AKO (lhs jet) (rhs Air-craft))        
)
(reset)

(defrule relatiiAKO
    (AKO (lhs ?z) (rhs ?x))
    (AKO (lhs ?x) (rhs ?y))
    =>
    (printout t ?z " AKO " ?x " AKO " ?y crlf)
    
    )
(defrule relatiiIS-A_AKO
    (IS-A (lhs ?a)(rhs ?z))
    (AKO (lhs ?z) (rhs ?x))
    (AKO (lhs ?x) (rhs ?y))
    =>
    (printout t ?a " IS-A " ?z " AKO " ?x " AKO " ?y crlf)
    )

(run)










