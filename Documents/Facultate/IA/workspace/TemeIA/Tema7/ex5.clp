(deftemplate planta
    (slot nume)
    (slot simptoma))

(assert (planta(nume planta1)(simptoma culPurpurie)))
(assert (planta(nume planta2)(simptoma semScorojite)))
(facts)

(defrule simptChircitura
    (planta(nume ?n)(simptoma chircitura))
    =>
    (printout t "Planta " ?n " are o deficienta de nitrogen" crlf))

(defrule simptNuantaGalben
    (planta(nume ?n)(simptoma nuantaGalben))
    =>
    (printout t "Planta " ?n " are o deficienta de nitrogen" crlf))

(defrule simptFrunzeMaro
    (planta(nume ?n)(simptoma frunzeMaro))
    =>
    (printout t "Planta " ?n " are o deficienta de nitrogen" crlf))

(defrule simptChircituraRadacina
    (planta(nume ?n)(simptoma chircituraRadacina))
    =>
    (printout t "Planta " ?n " are o deficienta de fosfor" crlf))

(defrule simptCulPurpurie
    (planta(nume ?n)(simptoma culPurpurie))
    =>
    (printout t "Planta " ?n " are o deficienta de fosfor" crlf))

(defrule simptPedunctulDeformat
    (planta(nume ?n)(simptoma pedunctulDeformat))
    =>
    (printout t "Planta " ?n " are o deficienta de fosfor" crlf))

(defrule simptIntarziereCrestere
    (planta(nume ?n)(simptoma intarziereCrestere))
    =>
    (printout t "Planta " ?n " are o deficienta de fosfor" crlf))

(defrule simptFrunzeArse
    (planta(nume ?n)(simptoma frunzeArse))
    =>
    (printout t "Planta " ?n " are o deficienta de potasiu" crlf))

(defrule simptSemCorojite
    (planta(nume ?n)(simptoma semScorojite ))
    =>
    (printout t "Planta " ?n " are o deficienta de potasiu" crlf))

(run)