(deftemplate mostenire
    (slot supraclasa)
    (slot subclasa));;IS A

(deftemplate obiect1
    (slot subclasa)
    (slot obiect));;INST

(deftemplate caracteristici
    (slot subclasa)
    (slot love)
    (slot locomotion))

(assert(mostenire(supraclasa animal)(subclasa bird)))
(assert(mostenire(supraclasa bird)(subclasa ostrich)))
(assert(mostenire(supraclasa bird)(subclasa canary)))

(assert(obiect1(subclasa canary)(obiect canny)))
(assert(obiect1(subclasa ostrich)(obiect osten)))

(assert(caracteristici(subclasa bird)
        (love nil)
        (locomotion flying)))
(assert(caracteristici(subclasa ostrich)(love sand)(locomotion running)))
(assert(caracteristici(subclasa canary)
        (love nil)(locomotion nil)
        ))

(defrule r
    (mostenire ( supraclasa ?p1){ supraclasa == animal })
    (mostenire ( subclasa ?p2&~bird){ supraclasa == bird })
    (mostenire ( subclasa ?p2'){ supraclasa == bird || supraclasa == animal })
    (obiect1 ( obiect ?p3){ subclasa == ?p2 })
    (caracteristici ( love ?p4){  subclasa == ?p2 || subclasa == ?p3})
    (caracteristici ( locomotion ?p5){ subclasa == ?p2' || subclasa == ?p3 })
    
    =>
    
    (printout t " Bird is an " ?p1 crlf )

    (printout t " *** " ?p2 " is a bird " crlf )

    (printout t " --- " ?p3 " INST of " ?p2 crlf )

    (printout t " ___ " ?p2 " loves " ?p4 crlf )

    (printout t " ... "?p2' " MAIN LOC is " ?p5 crlf )

    (printout t ?p3 " loves " ?p4 crlf )

    (printout t ?p3 " MAIN LOC is " ?p5 crlf )
    
    )

(run)
