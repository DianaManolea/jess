(deftemplate zbor
    (slot plecare)
    (slot destinatie)
    (slot distanta))

(assert (zbor (plecare Toronto)(destinatie Vancouver)(distanta 3040)))
(assert (zbor (plecare Toronto)(destinatie LosAngeles)(distanta 3377)))
(assert (zbor(plecare Toronto)(destinatie Chicago)(distanta 610)))
(assert (zbor (plecare NewYork)(destinatie Toronto)(distanta 557)))
(assert (zbor (plecare NewYork)(destinatie Chicago)(distanta 1144)))
(assert (zbor (plecare NewYork)(destinatie Denver)(distanta 2616)))
(assert (zbor (plecare Chicago)(destinatie Denver)(distanta 1474)))
(assert (zbor (plecare Denver)(destinatie Memphis)(distanta 1410)))
(assert (zbor (plecare Denver)(destinatie Housion)(distanta 1350)))
(assert (zbor (plecare Denver)(destinatie LosAngeles)(distanta 1115)))
(assert (zbor (plecare Housion)(destinatie Losangeles)(distanta 1752)))

(facts)

(defrule pronescDinNewYork
    (zbor(plecare NewYork)(destinatie ?d)(distanta ?dd))
    =>
    (printout t "Din New York pleaca un zbor in " ?d "(" ?dd "km)" crlf)
    )

(run)

(defrule distanteIntre800-2200
    (zbor(plecare ?p)(destinatie ?d)(distanta ?dd ))
    (test(< 800 ?dd))
    (test(< ?dd 2200))
    =>
    (printout t "Intre " ?p " si " ?d " distanta este " ?dd " km" crlf))

(run)
  