/*
	Ea tine pixul
	S	PV	CD
*/

(deftemplate tzine
	"comment"
	(slot subiect) (slot cd))

(assert (tzine (subiect Ana) (cd foarfeca)))
(assert (tzine (subiect Anca) (cd toporul)))
(assert (tzine (subiect Oana) (cd poza)))
(facts)


(defrule scoateFapt ?id <- (tzine (subiect ana) (cd foarfeca)) =>
    	(retract ?id) (printout t "subiect " ?s "CD " ?cd))

(deftemplate contor(slot valoare))
(assert (contor (valoare 0)))
(defrule scoate 
    ?cnt  <- (contor (valoare ?v & 0))
    ?id <- (tzine (subiect ?s) (cd ?cd))
    =>
    (retract ?id)
    (printout t "subiect" ?s "cd" ?cd crlf)
    (modify ?cnt (valoare (+ ?v 1)))
    )

(run)

