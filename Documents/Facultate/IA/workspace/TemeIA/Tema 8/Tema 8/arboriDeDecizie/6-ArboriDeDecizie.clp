(deftemplate tipulDeCredit
    (slot intrebare)
    (slot raspuns)
)

(assert (tipulDeCredit (intrebare nil) (raspuns nil)))

(defrule perFizica1
    (tipulDeCredit (intrebare nil)(raspuns nil))
    =>
    (printout t "Sunteti persona fizica? (DA/NU)" crlf)
    (bind ?read (read))
    (assert (tipulDeCredit (intrebare "Persoana Fizica")(raspuns ?read)))
)

(defrule perFizica2
    (tipulDeCredit (intrebare "Persoana Fizica")(raspuns DA))
    =>
    (printout t "Doriti pe termen lung? (DA/NU)" crlf)
    (bind ?read (read))
    (assert (tipulDeCredit (intrebare "Credit pe termen lung")(raspuns ?read)))
)

(defrule creditDeTrezorerie
    (tipulDeCredit (intrebare "Credit pe termen lung")(raspuns DA))
    =>
    (printout t "Creditul acordat pt D-voasta este CREDIT PERSONAL" crlf)
)
(run)