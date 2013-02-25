(deftemplate Animal (slot nume) (slot mediu) (slot zona) (slot regim) (slot consuma) (slot mViata) (slot reproducere))

(assert (Animal (nume iepure) (mediu terestru) (zona mediteraneana) (regim ierbivor) (consuma consumat) (mViata diurn) (reproducere pui)))
(assert (Animal (nume urs) (mediu terestru) (zona polara) (regim carnivor) (consuma consumator) (mViata diurn) (reproducere pui)))
(assert (Animal (nume foca) (mediu terestru) (zona polara) (regim carnivor) (consuma consumator) (mViata diurn) (reproducere pui)))
(assert (Animal (nume broasca) (mediu semiacvatic) (zona mediteraneana) (regim ierbivor) (consuma consumat) (mViata diurn) (reproducere oua)))
(assert (Animal (nume gaina) (mediu terestru) (zona mediteraneana) (regim ierbivor) (consuma consumat) (mViata diurn) (reproducere oua)))
(assert (Animal (nume lup) (mediu terestru) (zona mediteraneana) (regim carnivor) (consuma consumator) (mViata diurn) (reproducere pui)))
(assert (Animal (nume cuc) (mediu aerian) (zona mediteraneana) (regim ierbivor) (consuma consumat) (mViata diurn) (reproducere oua)))
(assert (Animal (nume lemur) (mediu terestru) (zona ecuatoriala) (regim ierbivor) (consuma consumat) (mViata diurn) (reproducere pui)))


(defrule semiacvatic
    ;?nume<- (Animal (nume))
    (Animal (nume ?nume)(mediu semiacvatic))
    =>
    (printout t "Animale semiacvatice: " ?nume crlf)
    )
(defrule medit
    ;?nume<- (Animal (nume))
    (Animal (nume ?nume)(regim ierbivor) (zona mediteraneana))
    =>
    (printout t "Animale zona mediteraneana " ?nume crlf)
    )
(run)