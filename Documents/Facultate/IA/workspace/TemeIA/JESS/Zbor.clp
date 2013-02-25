(deftemplate Zbor (slot plecare) (slot sosire) (slot distanta))

(assert (Zbor (plecare NewYork) (sosire Chicago) (distanta 900)))
(assert (Zbor (plecare Chicago) (sosire Denver) (distanta 1000)))
(assert (Zbor (plecare NewYork) (sosire Toronto) (distanta 500)))
(assert (Zbor (plecare NewYork) (sosire Denver) (distanta 1800)))
(assert (Zbor (plecare Toronto) (sosire LA) (distanta 2500)))
(assert (Zbor (plecare Toronto) (sosire Chicago) (distanta 500)))
(assert (Zbor (plecare Toronto) (sosire Calgary) (distanta 1700)))
(assert (Zbor (plecare Denver) (sosire Urbana) (distanta 1000)))
(assert (Zbor (plecare Denver) (sosire Huston) (distanta 1000)))
(assert (Zbor (plecare Huston) (sosire LA) (distanta 1500)))
(assert (Zbor (plecare Denver) (sosire LA) (distanta 1000)))

(defrule NY
    ?sosire<- (Zbor (sosire))
    ?distanta<- (Zbor (distanta))
    (Zbor (plecare NewYork) (sosire ?sosire) (distanta ?distanta))
    =>
    (printout t "Zborurile care pleaca din New York la: " ?sosire " distanta: " ?distanta crlf)   
)

(defrule dist
    ?plecare<- (Zbor (plecare))
    ?sosire<- (Zbor (sosire))
    ?distanta<- (Zbor (distanta :(> 800) & :(< 2200)))
    =>
    (printout t "Zborurile cu distanta cuprinsa intre 800 si 2200" crlf "plecare :" ?plecare " sosire: " ?sosire " distanta: " ?distanta crlf) 
    )
