(deftemplate senzor
    (slot s1)
    (slot s2)
    (slot s3)
    (slot s4)
    (slot s5)
    (slot s6)
    (slot s7)
    (slot s8)
    (slot s9)
    (slot s10))

(assert(senzor(s1 OK)(s2 OK)(s3 OK)(s4 OK)))

(defglobal ?*c* = 0)

(defrule numara
    (senzor(s1 ?s1)(s2 ?s2)(s3 ?s3)(s4 ?s4))
    (test (eq ?s1 OK))
        
        
    =>
    
    (printout t "Este")
    )

(run)