(deftemplate Animal (slot nume) (slot mediu) (slot zona) (slot regim)(slot mViata) (slot reproducere)(slot tip))

(assert (Animal (nume iepure) (mediu terestru)(tip consumat) (zona mediteraneana) (regim vegetarian)  (mViata diurn) (reproducere pui)))
(assert (Animal (nume urspolar) (mediu terestru) (tip consumator)(zona polara) (regim carnivor)  (mViata diurn) (reproducere pui)))
(assert (Animal (nume foca) (mediu terestru) (tip consumator)(zona polara) (regim carnivor)  (mViata diurn) (reproducere pui)))
(assert (Animal (nume broasca) (mediu semiacvatic) (tip consumat)(zona mediteraneana) (regim vegetarian)  (mViata diurn) (reproducere oua)))
(assert (Animal (nume gaina) (mediu terestru) (tip consumat)(zona mediteraneana) (regim vegetarian)  (mViata diurn) (reproducere oua)))
(assert (Animal (nume lup) (mediu terestru) (tip consumator)(zona mediteraneana) (regim carnivor)  (mViata diurn) (reproducere pui)))
(assert (Animal (nume papagal) (mediu aerian) (tip consumat)(zona mediteraneana) (regim vegetarian) (mViata diurn) (reproducere pui)))
(assert (Animal (nume oaie) (mediu terestru) (tip consumat)(zona mediteraneana) (regim vegetarian) (mViata diurn) (reproducere pui)))


(defrule semiacvatic
    ;?nume<- (Animal (nume))
    (Animal (nume ?nume)(mediu semiacvatic))
    =>
    (printout t "Animale semiacvatice: " ?nume crlf)
    )
(defrule medit
    ;?nume<- (Animal (nume))
    (Animal (nume ?nume)(regim vegetarian) (zona mediteraneana))
    =>
    (printout t "Animale zona mediteraneana " ?nume crlf)
    )
(defrule perechianimale
    ?consumator <- (Animal (nume ?nume1)(tip consumator)(mediu ?m) (zona ?z) (regim carnivor) )
    ?consumat <- (Animal(nume ?nume2)(tip consumat) (mediu ?m)(zona ?z) (regim vegetarian))
    =>
    (retract ?consumator ?consumat)
    (printout t "Animal consumator:" ?nume1 " Animal consumat:" ?nume2 crlf)
    )
(run)