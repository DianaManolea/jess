
(deftemplate meniu(slot mancare)(slot vin))

(assert(meniu(mancare peste)(vin alb-sec )))
(assert(meniu(mancare stridii)(vin alb-sec)))
(assert(meniu(mancare melci)(vin alb-sec)))
(assert(meniu(mancare crustacee)(vin alb-sec)))
(assert(meniu(mancare antreuri)(vin alb-sec)))
(assert(meniu(mancare aperitive)(vin alb-sec)))
(assert(meniu(mancare antreuri)(vin alb-demisec)))
(assert(meniu(mancare aperitive)(vin alb-demisec)))
(assert(meniu(mancare antreuri)(vin rose)))
(assert(meniu(mancare carne-alba)(vin rosu)))
(assert(meniu(mancare carne-rosie)(vin rosu)))
(assert(meniu(mancare vanat)(vin rosu)))
(assert(meniu(mancare branzeturi_fermentate)(vin rosu)))
(assert(meniu(mancare branzeturi-semidure)(vin rosu)))
(assert(meniu(mancare branze-de-oi)(vin rose)))
(assert(meniu(mancare branza-proaspata)(vin alb)))
(assert(meniu(mancare desert-zaharat)(vin spumant)))
(assert(meniu(mancare fructe)(vin alb-dulce)))
(assert(meniu(mancare cafea)(vin vinars)))

(defrule regula1
	(meniu(mancare ?m)(vin alb-sec))
    =>
	(printout t "mancarea care se potriveste cu vinul alb sec este:" ?m" , " crlf)
)

(defrule regula2
    (meniu(mancare ?m)(vin alb-demisec))
	=>
	(printout t "mancarea care se potriveste cu vinul alb demisec este:" ?m" , " crlf)
)

(defrule regula3
    (meniu(mancare ?m)(vin rose))
	=>
	(printout t "mancarea care se potriveste cu vinul rose este:" ?m" , " crlf)
)

(defrule regula4
    (meniu(mancare ?m)(vin rosu))
	=>
   (printout t "mancarea care se potriveste cu vinul rosu este:" ?m" , " crlf)
)

(defrule regula5
   (meniu(mancare ?m)(vin alb-dulce))
	=>
   (printout t "mancarea care se potriveste cu vinul alb dulce este:" ?m" , " crlf)
)

(defrule regula6
   (meniu(mancare ?m)(vin alb))
   =>
   (printout t "mancarea care se potriveste cu vinul alb este:" ?m" , " crlf)
)

(defrule regula7
    (meniu(mancare ?m)(vin spumant))
	=>
	(printout t "mancarea care se potriveste cu vinul spumant este:" ?m" , " crlf)
)

(defrule regula8
    (meniu(mancare ?m)(vin vinars))
	=>
	(printout t "mancarea care se potriveste cu vinul vinars este:" ?m" , " crlf)
)

(run)