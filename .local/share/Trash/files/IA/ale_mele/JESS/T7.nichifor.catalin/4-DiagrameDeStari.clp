(deftemplate tramvai (slot statie) (slot ciclu) (slot stare))

(defglobal ?*ciclu* = 0)

(assert (tramvai (statie start) (ciclu ?*ciclu*) (stare initiala)))

(defrule pornire
    ?id <- (tramvai (stare initiala|intoarcere) (ciclu ?c))
    (test (<= ?c 2))
    =>
    (retract ?id)
    (++ ?*ciclu*)
    (assert (tramvai (statie s-1) (ciclu ?*ciclu*) (stare plecare-depou)))
    (printout t "Tramvaiul a plecat din depou. A inceput ciclul cu numarul " ?*ciclu* "." crlf)
    )
(defrule sosire-statie-1
    ?id <- (tramvai (stare plecare-depou))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare oprire-1)))
    (printout t "Tramvaiul soseste in prima statie." crlf)
    )
(defrule stationare-1
    ?id <- (tramvai (stare oprire-1))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare stationare-1)))
    (printout t "Tramvaiul este oprit in prima statie." crlf)
    )
(defrule plecare-1
    ?id <- (tramvai (stare stationare-1))
    =>
    (retract ?id)
    (assert (tramvai (statie 1-2) (ciclu ?*ciclu*) (stare plecare-1)))
    (printout t "Tramvaiul a plecat din prima statie." crlf)
    )
(defrule sosire-statie-2
    ?id <- (tramvai (stare plecare-1))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare oprire-2)))
    (printout t "Tramvaiul soseste in cea de-a doua statie." crlf)
    )
(defrule stationare-2
    ?id <- (tramvai (stare oprire-2))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare stationare-2)))
    (printout t "Tramvaiul este oprit in cea de-a doua statie." crlf)
    )
(defrule plecare-2
    ?id <- (tramvai (stare stationare-2))
    =>
    (retract ?id)
    (assert (tramvai (statie 2-3) (ciclu ?*ciclu*) (stare plecare-2)))
    (printout t "Tramvaiul a plecat din cea de-a doua statie." crlf)
    )
(defrule sosire-statie-3
    ?id <- (tramvai (stare plecare-2))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare oprire-3)))
    (printout t "Tramvaiul soseste in cea de-a treia statie." crlf)
    )
(defrule stationare-3
    ?id <- (tramvai (stare oprire-3))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare stationare-3)))
    (printout t "Tramvaiul este oprit in cea de-a treia statie." crlf)
    )
(defrule plecare-3
    ?id <- (tramvai (stare stationare-3))
    =>
    (retract ?id)
    (assert (tramvai (statie 3-4) (ciclu ?*ciclu*) (stare plecare-3)))
    (printout t "Tramvaiul a plecat din cea de-a treia statie." crlf)
    )
(defrule sosire-statie-4
    ?id <- (tramvai (stare plecare-3))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare oprire-4)))
    (printout t "Tramvaiul soseste in cea de-a patra statie." crlf)
    )
(defrule stationare-4
    ?id <- (tramvai (stare oprire-4))
    =>
    (retract ?id)
    (assert (tramvai (ciclu ?*ciclu*) (stare stationare-4)))
    (printout t "Tramvaiul este oprit in cea de-a patra statie." crlf)
    )
(defrule plecare-4
    ?id <- (tramvai (stare stationare-4))
    =>
    (retract ?id)
    (assert (tramvai (statie 4-s) (ciclu ?*ciclu*) (stare plecare-4)))
    (printout t "Tramvaiul a plecat din cea de-a patra statie." crlf)
    )
(defrule intoarce
    ?id <- (tramvai (stare plecare-4))
    =>
    (retract ?id)
    (assert (tramvai (statie stop) (ciclu ?*ciclu*) (stare intoarcere)))
    (printout t "Tramvaiul intoarce." crlf)
    )
(run)