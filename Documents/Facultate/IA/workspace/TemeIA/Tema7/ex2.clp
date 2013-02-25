(deftemplate multime
    (slot nume)
    (multislot submultimi)
    (multislot supramultimi)
    (multislot elemente)
    (multislot descriere))


(assert(multime(nume A)(elemente 1 2 3 4 5)))
(assert(multime(nume B)(elemente albastru verde galben rosu negru)))
(assert(multime(nume C)(supramultimi R)(descriere x\|x>=0 x apartine R)))

(facts)