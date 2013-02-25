(deftemplate note
    (slot matematica (type INTEGER))
    (slot informatica (type INTEGER))
    (slot fizica (type INTEGER))
    (slot chimie (type INTEGER))
    (slot limbaRomana (type INTEGER))
    (slot limbaEngleza (type INTEGER))
    (slot limbaGermana (type INTEGER))
    (slot economie (type INTEGER))
    (slot psihologie (type INTEGER)))

(assert (note (matematica 0)(informatica 0)(fizica 0)(chimie 0)(limbaRomana 0)(limbaEngleza 0)(limbaGermana 0)(economie 0)(psihologie 0)))

(defrule citeste
    ?id<-(note (matematica 0)(informatica 0)(fizica 0)(chimie 0)(limbaRomana 0)(limbaEngleza 0)(limbaGermana 0)(economie 0)(psihologie 0))
    =>
    (printout t "Notele elevului:" crlf)
    (printout t "-matematica: ")
    (bind ?m (read))
    (printout t "-informatica: ")
    (bind ?i (read))
     (printout t "-fizica: ")
    (bind ?f (read))
     (printout t "-chimie: ")
    (bind ?c (read))
     (printout t "-limbaRomana: ")
    (bind ?lr (read))
     (printout t "-limbaEngleza: ")
    (bind ?le (read))
     (printout t "-limbaGermana: ")
    (bind ?lg (read))
     (printout t "-economie: ")
    (bind ?e (read))
     (printout t "-psihologie: ")
    (bind ?p (read))
    (retract ?id)
    (assert (note (matematica ?m)(informatica ?i)(fizica ?f)(chimie ?c)(limbaRomana ?lr)(limbaEngleza ?le)(limbaGermana ?lg)(economie ?e)(psihologie ?p)))
)

(defrule facultateMateInfo
    (note (matematica ?m & :(>= ?m 8))(informatica ?i & :(>= ?i 8))(fizica ?f & :(>= ?f 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Matematica si Informatica" crlf)
    )

(defrule facultateLitere
    (note (limbaRomana ?m & :(>= ?m 8))(limbaEngleza ?i & :(>= ?i 8))(limbaGermana ?f & :(>= ?f 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Litere" crlf)
    )

(defrule facultatePsihologie
    (note (limbaRomana ?m & :(>= ?m 8))(psihologie ?i & :(>= ?i 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Sociologie si Psihologie" crlf)
    )

(defrule facultateFizica
    (note (fizica ?f & :(>= ?f 8))(matematica ?m & :(>= ?m 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Fizica" crlf)
    )

(defrule facultateChimie
    (note (chimie ?f & :(>= ?f 8))(matematica ?m & :(>= ?m 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Chimie" crlf)
    )

(defrule facultateEconomie
    (note (limbaRomana ?f & :(>= ?f 7))(matematica ?m & :(>= ?m 7))(economie ?e & :(>= ?e 8)))
    =>
    (printout t "Studentul poate sa isi depuna dosarul la Facultatea de Economie si de Administrare a Afacerilor" crlf)
    )

(run)