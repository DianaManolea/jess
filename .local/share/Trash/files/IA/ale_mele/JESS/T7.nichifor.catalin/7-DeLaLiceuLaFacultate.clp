(deftemplate note
    (slot romana)
    (slot matematica)
    (slot informatica)
    (slot fizica)
    (slot geografie)
    (slot biologie)
    (slot chimie)
    (slot istorie)
    (slot engleza)
    )

(reset)

(defrule start
    =>
    (printout t crlf "Introduceti media din anii de liceu la urmatoarele materii:" crlf)
    (printout t "Limba Romana: ")
    (bind ?rom (read))
    (printout t "Matematica: ")
    (bind ?mate (read))
    (printout t "Informatica: ")
    (bind ?info (read))
    (printout t "Fizica: ")
    (bind ?fiz (read))
    (printout t "Geografie: ")
    (bind ?geogra (read))
    (printout t "Biologie: ")
    (bind ?bio (read))
    (printout t "Chimie: ")
    (bind ?chim (read))
    (printout t "Istorie: ")
    (bind ?ist (read))
    (printout t "Limba Engleza: ")
    (bind ?engl (read))
    (assert (note (romana ?rom) (matematica ?mate) (informatica ?info)
            (fizica ?fiz) (geografie ?geogra) (biologie ?bio)
            (chimie ?chim) (istorie ?ist) (engleza ?engl)))
)
(run)

(defrule chimie
    (note (chimie :(>= 8)) (biologie :(>= 8)) (geografie :(>= 8)))
    =>
    (printout t "Ati putea alege Facultatea de Chimie, Biologie, Geografie." crlf)
)
(defrule fizica
    (note (fizica :(>= 8)) (matematica :(>= 8)))
    =>
    (printout t "Ati putea alege Facultatea de Fizica." crlf)
)
(defrule litere
    (note (romana :(>= 8)) (engleza :(>= 8)) (istorie :(>= 8)))
    =>
    (printout t "Ati putea alege Facultatea de Litere, Istorie si Teologie." crlf)
)
(defrule matematica
    (note (matematica :(>= 8)) (informatica :(>= 8)) (engleza :(>= 8)))
    =>
    (printout t "Ati putea alege Facultatea de Matematica si Informatica." crlf)
)
(run)