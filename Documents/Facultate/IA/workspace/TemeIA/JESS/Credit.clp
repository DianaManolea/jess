(deftemplate Intreb (slot intrebare) (slot raspuns))

(assert (Intreb (intrebare nil) (raspuns nil)))

(defrule r1
    (Intreb (intrebare nil) (raspuns  nil))
    =>
    (printout t "Persoana are peste 30 ani?(DA/NU)" crlf)
    (bind ?r (read))
    (assert (Intreb (intrebare "Persoana are peste 30 ani") (raspuns ?r)))
    )

(defrule r2
    (Intreb (intrebare "Persoana are peste 30 ani") (raspuns  DA))
    =>
    (printout t "Lucreaza?(DA/NU)" crlf)
    (bind ?r (read))
    (assert (Intreb (intrebare "Lucreaza") (raspuns ?r)))
    )

(defrule r3
    (Intreb (intrebare "Persoana are sub 30 ani") (raspuns  NU))
    =>
    (printout t "Student?(DA/NU)" crlf)
    (bind ?r (read))
    (assert (Intreb (intrebare "Student") (raspuns ?r)))
    )

(defrule daLucreaza
    (Intreb (intrebare "Lucreaza") (raspuns  DA))
    =>
    (printout t "Acte necesare: copie dupa buletin si adeverinta de salariu" crlf)
    )

(defrule r4
    (Intreb (intrebare "Lucreaza") (raspuns  NU))
    =>
    (printout t "Are datorii la banca?(DA/NU)" crlf)
    (bind ?r (read))
    (assert (Intreb (intrebare "Are datorii la banca") (raspuns ?r)))
    )

(defrule nuDatorii
    (Intreb (intrebare "Are datorii la banca") (raspuns  NU))
    =>
    (printout t "Acte necesare: copie buletin + imputernicit" crlf)
    )

(defrule daDatorii
    (Intreb (intrebare "Are datorii la banca") (raspuns  DA))
    =>
    (printout t "Nu dam credit" crlf)
    )

(defrule r5
    (Intreb (intrebare "Student") (raspuns  DA))
    =>
    (printout t "Lucreaza studentul?(DA/NU)" crlf)
    (bind ?r (read))
    (assert (Intreb (intrebare "Lucreaza studentul") (raspuns ?r)))
    )

(defrule daLucreazaStud
    (Intreb (intrebare "Lucreaza studentul") (raspuns  DA))
    =>
    (printout t "Acte necesare: copie buletin, copie carnet student, copie adeverinta de salariu" crlf)
    )

(defrule nuLucreazaStud
    (Intreb (intrebare "Lucreaza studentul") (raspuns  NU))
    =>
    (printout t "Acte necesare: copie buletin, copie carnet student, imputernicit" crlf)
    )

(run)
(facts)
