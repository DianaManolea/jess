(deftemplate Pacient (slot temperatura) (slot durere) (slot tuse) (slot greata))
(deftemplate diagnostic (slot diagnostic))

(assert (diagnostic))

(deffunction simptomePacient
    ()
    (printout t crlf "Va rugam sa raspundeti la urmatoarele intrebari despre pacient pentru a stabili un diagnostic pentru acesta." crlf)
    (printout t "(raspundeti intr-un singur cuvant, folosind doar litere mici ale alfabetului sau cifre)" crlf crlf)
    (printout t "Care este temperatura pacientului?" crlf)
    (bind ?temperatura (read))
    (printout t "In ce zona a corpului are pacientul dureri?" crlf)
    (bind ?durere (read))
    (printout t "Pacientul tuseste?(da/nu)" crlf)
    (bind ?tuse (read))
    (printout t "Are o stare de greata?(da/nu)" crlf)
    (bind ?greata (read))
    (assert (Pacient (temperatura ?temperatura) (durere ?durere) (tuse ?tuse) (greata ?greata)))
)
(simptomePacient)

(defrule apendicita
    (Pacient (temperatura ?t) (durere abdominala|abdomen) (greata da))
    (test (>= ?t 38))
    =>
    (retract 0)
    (assert (diagnostic (diagnostic "Pacientul poate avea apendicita.")))
)
(defrule meningita
    (Pacient (temperatura ?t) (durere capului|cap) (tuse nu) (greata da))
    (test (>= ?t 39))
    =>
    (retract 0)
    (assert (diagnostic (diagnostic "Pacientul poate avea meningita.")))
)
(defrule raceala
    (declare (salience 1))
    (Pacient (temperatura ?t) (durere capului|cap) (tuse da))
    (test (>= ?t 38))
    =>
    (retract 0)
    (assert (diagnostic (diagnostic "Pacientul poate avea o raceala.")))
)
(defrule gripa
    (declare (salience 0))
    (Pacient (temperatura ?t) (durere capului|cap) (tuse da))
    (test (>= ?t 38))
    =>
    (retract 0)
    (assert (diagnostic (diagnostic "Pacientul poate avea gripa.")))
)

(defrule diagnostic
    (diagnostic (diagnostic ?d))
    (not (diagnostic (diagnostic nil)))
    =>
    (printout t ?d crlf)
)
(defrule faraDiagnostic
    (diagnostic (diagnostic nil))
	=>
    (printout t "Nu s-a putut stabili un diagnostic. Este posibil ca pacientul sa fie sanatos." crlf)    
)
(run)