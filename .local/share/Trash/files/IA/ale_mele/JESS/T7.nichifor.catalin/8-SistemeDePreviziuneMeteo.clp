(deftemplate stare (slot timpulZilei) (slot cer) (slot nori) (slot vant) (slot ceata))

(assert (stare (timpulZilei seara) (cer rosu) (nori cumulus) (vant nord-est-sud)))
(assert (stare (timpulZilei inainte-de-miezul-noptii) (nori cumulonimbus)))
(assert (stare (nori cirrostratus) (vant nord-est-sud)))

(defrule senin
    (stare (timpulZilei seara) (cer rosu))
    =>
    (printout t "Cerul va fi senin maine, nu vor fi precipitatii, dar va fi ger." crlf)
)
(defrule cald
    (stare (timpulZilei noapte|dimineata) (ceata da))
    =>
    (printout t "Va fi cald in timpul zilei." crlf)
)
(defrule buna
    (stare (nori cumulus))
    =>
    (printout t "Vremea va fi buna." crlf)
)
(defrule nimbostratus
    ?id <- (stare (nori cumulus) (vant nord-est-sud))
    =>
    (modify ?id (nori nimbostratus))
)
(defrule ploaie
    ?id <- (stare (nori cirrocumulus) (vant nord-est-sud))
    =>
    (printout t "Urmeaza sa ploua." crlf)
)
(defrule cumulonimbus
    ?id <- (stare (nori stratocumulus) (vant nord-est-sud))
    =>
    (modify ?id (nori cumulonimbus))
)
(defrule ploaie-scurta
    (stare (nori nimbostratus) (vant sud-vest-nord))
    =>
	(printout t "Urmeaza o ploaie scurta." crlf)    
)
(defrule ploaie-lunga
    (stare (nori nimbostratus) (vant nord-est-sud))
    =>
	(printout t "Urmeaza o ploaie lunga." crlf)    
)
(defrule zapada
    (stare (nori cumulonimbus) (timpulZilei inainte-de-miezul-noptii))
    =>
	(printout t "Vor urma caderi de zapada." crlf)    
)
(defrule ploaie-15-24
    (stare (nori cirrostratus) (vant nord-est-sud))
    =>
    (printout t "Va ploua in urmatoarele 15-24 de ore." crlf)
)
(defrule ploaie-24
    (stare (nori altostratus) (vant nord-est-sud))
    =>
	(printout t "Maine va ploua." crlf)    
)
(defrule ploaie-15-20
    (stare (nori altocumulus) (vant nord-est-sud))
    =>
	(printout t "Va ploua in urmatoarele 15-20 de ore." crlf)    
)
(run)