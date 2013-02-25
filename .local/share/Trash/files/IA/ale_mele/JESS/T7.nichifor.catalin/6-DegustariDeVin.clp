(deftemplate meniu (declare (ordered TRUE)))

(reset)

(defrule start
    =>
    (printout t crlf "MENIU:" crlf)
    (printout t "*************************************" crlf)
    (printout t " 1. salata de creveti" crlf)
    (printout t " 2. salata de vara" crlf)
    (printout t " 3. risotto cu trufe negre" crlf)
    (printout t " 4. piept de curcan umplut cu masline" crlf)
    (printout t " 5. friptura de miel" crlf)
    (printout t " 6. tempura de fasole verde" crlf)
    (printout t " 7. paste cu parmezan si trufe negre" crlf)
    (printout t "*************************************" crlf crlf)
    (printout t "Alegeti preparatele dorite: ")
    (bind ?meniu (str-cat "(meniu " (readline) ")"))
    (assert-string ?meniu)
    )
(run)
(printout t "Va recomandam urmatoarele vinuri:" crlf)
(defrule creveti
    (meniu $? salata de creveti|creveti,|creveti. $?)
    =>
    (printout t "Prosseco, spumant alb sau rose, alb sec" crlf)
    )
(defrule vara
    (meniu $? salata de vara|vara,|vara. $?)
    =>
    (printout t "albe, proaspete, demiseci." crlf)
    )
(defrule risotto
    (meniu $? risotto cu trufe negre|negre,|negre. $?)
    =>
    (printout t "Riesling Sevruga Terase Danubiene, Chardonnay Domeniul Coroanei 2007" crlf)
    )
(defrule curcan
    (meniu $? piept de curcan umplut cu masline|masline,|masline. $?)
    =>
    (printout t "Chardonnay Tarapaca Varietal, Price Stirbey Vitis Vetus Sauvignon Blanc" crlf)
    )
(defrule miel
    (meniu $? friptura de miel|miel,|miel. $?)
    =>
    (printout t "Cabernet Sauvignon Domeniul Coroanei Segarcea 2007, Santomas Grande Cuvee 2004 Refosk" crlf)
    )
(defrule tempura
    (meniu $? tempura de fasole verde|verde,|verde. $?)
    =>
    (printout t "Riesling Italian de la Domeniul Coroanei Segarcea, Faurar – Alb de Ceptura" crlf)
    )
(defrule paste
    (meniu $? paste cu parmezan si trufe negre|negre,|negre. $?)
    =>
    (printout t "Cabernet Sauvignon La Cetate 2006, Prince Matei 2007" crlf)
    )
(run)