(deftemplate nori
    (slot nume)
    (slot bataieVant)
    (slot interval)
    (slot vizibilitate))


(assert(nori(nume cumulus)));;vreme buna
(assert(nori(nume cirroculus)(bataieVant NE-S)));;ploaie 
(assert(nori(nume stratocumulus)(nume stratocumulus)))
