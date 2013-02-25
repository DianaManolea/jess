(deftemplate animal(slot specie)(slot sex)(slot inaltime))

(deffacts animale
    (animal (specie soarece)(sex M)(inaltime 1))
    (animal (specie soarece)(sex F)(inaltime 1))
    (animal (specie veverita)(sex M)(inaltime 2))
    (animal (specie veverita)(sex F)(inaltime 2))
    (animal (specie pisica)(sex M)(inaltime 3))
    (animal (specie pisica)(sex F)(inaltime 3))
    (animal (specie caine)(sex M)(inaltime 4))
    (animal (specie caine)(sex F)(inaltime 4))
    (animal (specie vaca)(sex M)(inaltime 5))
    (animal (specie vaca)(sex F)(inaltime 5))
    (animal (specie elefant)(sex M)(inaltime 6))
    (animal (specie elefant)(sex F)(inaltime 6))
)

(reset)
(facts)