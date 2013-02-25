(deftemplate animal(slot denumire)(slot nutrimente)
    (slot modViata)(slot mediuViata)
    (slot reproducere)(slot mancare)(slot zonaMediuViata))


(assert(animal(denumire lup)(nutrimente carnivor)
        (modViata diurn)(mediuViata terestru)
        (reproducere pui-vii)(mancare oaie)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire  urs_polar)(nutrimente carnivor)
        (modViata diurn)(mediuViata terestru)
        (reproducere pui-vii)(mancare foca)
        (zonaMediuViata polar)))
(assert(animal(denumire foca)(nutrimente carnivor)
        (modViata diurn)(mediuViata semiacvatic)
        (reproducere pui-vii)(mancare peste)
        (zonaMediuViata polar)))
(assert(animal(denumire oaie)(nutrimente vegetarian)
        (modViata diurn)(mediuViata terestru)
        (reproducere pui-vii)(mancare iarba)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire capra)(nutrimente vegetarian)
        (modViata diurn)(mediuViata terestru)
        (reproducere pui-vii)(mancare iarba)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire vaca)(nutrimente vegetarian)
        (modViata diurn)(mediuViata terestru)
        (reproducere pui-vii)(mancare iarba)
        (zonaMediuViata mediteranean)))
(assert(animal(denumire broasca)(nutrimente vegetarian)
        (modViata diurn)(mediuViata semiacvatic)
        (reproducere pui-vii)(mancare iarba)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire peste)(nutrimente vegetarian)
        (modViata diurn)(mediuViata acvatic)
        (reproducere pui-vii)(mancare iarba)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire caine)(nutrimente vegetarian)
        (modViata diurn)(mediuViata acvatic)
        (reproducere pui-vii)(mancare sobolan)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire pisica)(nutrimente vegetarian)
        (modViata diurn)(mediuViata acvatic)
        (reproducere pui-vii)(mancare soarec)
        (zonaMediuViata temperat-continental)))
(assert(animal(denumire porc)(nutrimente vegetarian)
        (modViata diurn)(mediuViata acvatic)
        (reproducere pui-vii)
        (zonaMediuViata temperat-continental)))

(defrule regula1
    (animal (denumire ?d)(mancare ?m)(mediuViata semiacvatic)(modViata ?mm)(nutrimente ?n)(reproducere ?r)(zonaMediuViata ?z))
  =>
    (printout t "numele este " ?d crlf))

(run)

(defrule regula2
    (animal (denumire ?d) (nutrimente vegetarian) (zonaMediuViata mediteranean))
    =>
    (printout t "numele este " ?d crlf))

(run)

(defrule regula3
    (animal (denumire ?d) (mancare ?m))
    (animal (denumire ?x)(mancare ?d))
    =>
    (printout t "perechea este " ?d" "?x crlf))

(run)

(defrule regula4
    (animal (denumire ?d) (zonaMediuViata polar))
    =>
    (printout t "numele animalului este " ?d crlf))

(run)
