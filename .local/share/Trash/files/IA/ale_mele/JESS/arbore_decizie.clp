(deftemplate intrebare
    (multislot intrebare)
    (slot raspuns))

(deftemplate animal
    (slot nume))

(assert(intrebare(intrebare nil)(raspuns nil)))
(defrule i1
    (intrebare(intrebare nil)(raspuns nil))    
    =>
    (printout t "It is very big?")
    (bind ?r (read))
    (assert(intrebare(intrebare "It is very big?")(raspuns ?r)))
    )

(defrule i2
    (intrebare(intrebare "It is very big?")(raspuns NO))
    =>
    (printout t "Does is squeak?")
    (bind ?r (read))
    (assert(intrebare(intrebare "Does is squeak?")(raspuns ?r)))
    )

(defrule i3
    (intrebare(intrebare "Does is squeak?")(raspuns NO))
    =>
    (printout t "Guess squirrel")
    (assert(animal(nume squirrel)))
    )

(run)