(deftemplate cafea
    (slot valoareCurenta)
    (slot valoareMoneda)
)

(assert(cafea(valoareCurenta 0)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 5)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 10)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 15)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 20)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 25)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 30)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 35)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 40)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 45)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 50)(valoareMoneda 5)))
(assert(cafea(valoareCurenta 0)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 5)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 10)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 15)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 20)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 25)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 30)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 35)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 40)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 45)(valoareMoneda 25)))
(assert(cafea(valoareCurenta 50)(valoareMoneda 25)))


;(assert(cafea(valoareCurenta 0)(valoareMoneda nil)))
(defglobal ?*i* = 1)


(defrule r1
    (cafea(valoareCurenta 0)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta ?v)(valoareMoneda nil)))
    )
(defrule r2
    (cafea(valoareCurenta 5)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 5 ?v))(valoareMoneda nil)))
    )
(defrule r3
    (cafea(valoareCurenta 10)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 10 ?v))(valoareMoneda nil)))
    )
(defrule r4
    (cafea(valoareCurenta 15)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 15 ?v))(valoareMoneda nil)))
    )
(defrule r5
    (cafea(valoareCurenta 20)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 20 ?v))(valoareMoneda nil)))
    )
(defrule r6
    (cafea(valoareCurenta 25)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 25 ?v))(valoareMoneda nil)))
    )
(defrule r7
    (cafea(valoareCurenta 30)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 30 ?v))(valoareMoneda nil)))
    )
(defrule r8
    (cafea(valoareCurenta 35)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 35 ?v))(valoareMoneda nil)))
    )
(defrule r9
    (cafea(valoareCurenta 40)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 40 ?v))(valoareMoneda nil)))
    )
(defrule r10
    (cafea(valoareCurenta 45)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 45 ?v))(valoareMoneda nil)))
    )
(defrule r11
    (cafea(valoareCurenta 50)(valoareMoneda nil))
    =>
    (printout t "Valoarea monedei: ")
    (bind ?v (read))
    (assert(cafea(valoareCurenta (+ 50 ?v))(valoareMoneda nil)))
    )
(defrule r12
    (cafea(valoareCurenta ?v)(valoareMoneda nil))
    (test (>= ?v 55))
    =>
    (printout t "Suma necesara a fost atinsa !")
    )

(run)

