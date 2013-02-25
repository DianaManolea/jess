(deftemplate animal
    (slot nume)
    (slot dieta)
    (slot mod-de-viata)
    (slot mediu-de-viata)
    (slot reproducere)
    (multislot consumat-de)
    (slot zona))

(deffacts animale
    (animal (nume broasca) (dieta omnivor) (mediu-de-viata semiacvatic)
        (reproducere oua))
    (animal (nume testoasa) (dieta erbivor) (mediu-de-viata terestru)
        (reproducere oua) (zona mediteraneana))
    (animal (nume hiena) (dieta carnivor) (mediu-de-viata terestru)
        (reproducere pui) (zona mediteraneana))
    (animal (nume "urs polar") (dieta carnivor) (mediu-de-viata terestru)
        (reproducere pui) (zona polara))
    (animal (nume foca) (dieta omnivor) (mediu-de-viata semiacvatic)
        (reproducere pui) (zona polara) (consumat-de "urs polar"))
    (animal (nume furnica) (mod-de-viata diurn) (mediu-de-viata terestru)))

(reset)

(printout t "Animale cu mediul de viata semiacvatic:" crlf)
(defrule semiacvatic
    (animal (nume ?n) (mediu-de-viata semiacvatic))
    =>
    (printout t "-" ?n crlf))
(run)

(printout t "Animale erbivore din zona mediteraneana:" crlf)
(defrule erbivor
    (animal (nume ?n) (dieta erbivor) (zona mediteraneana))
    =>
    (printout t "-" ?n crlf))
(run)

(printout t "Perechi de animale de tipul animal consumator - animal consumat:" crlf)
(defrule pereche
    (animal (nume ?n) (consumat-de $? ?m $?))
    (animal (nume ?m))
    =>
    (printout t "-" ?m "->" ?n crlf)
)
(defrule furnica
    (animal (nume furnica))
    =>
    (printout t "-furnicar->furnica" crlf))
(run)

(printout t "Animale din zona polara:" crlf)
(defrule polara
    (animal (nume ?n))
    (not(animal(nume ?n)(zona ~polara)))
    =>
    (printout t "-" ?n crlf)
)
(run)