(deftemplate Multime (slot nume) (multislot submultimi) (multislot supramultimi) (multislot elemente) (multislot descriere))


(assert(Multime(nume A)(elemente 1 2 3 4 5)))
(assert(Multime(nume B)(elemente albastru verde galben rosu negru)))
(assert(Multime(nume C)(supramultimi R)(descriere x\|x>=0 x apartine R)))

(facts)
