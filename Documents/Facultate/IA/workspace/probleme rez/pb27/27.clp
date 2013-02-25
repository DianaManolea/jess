(deftemplate relat (slot comp1) (slot comp2))
(deffacts componente
	(relat (comp1 Comp-A) (comp2 Comp-B))
	(relat (comp1 Comp-A) (comp2 Comp-C))
	(relat (comp1 Comp-C) (comp2 Comp-D))
	(relat (comp1 Comp-C) (comp2 Comp-E))
	(relat (comp1 Comp-E) (comp2 Comp-A)))

(deffacts defecte (defect Comp-C))

(defrule propaga
	(defect ?p)
	(relat (comp1 ?p) (comp2 ?q))
	=>
	(assert (defect ?q)))

