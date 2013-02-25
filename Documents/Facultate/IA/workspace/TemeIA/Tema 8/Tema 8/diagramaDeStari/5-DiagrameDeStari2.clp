(deftemplate tramvai
    (slot depou1(allowed-values TRUE FALSE))
    (slot depou2(allowed-values TRUE FALSE))
    (slot in_accelerare(allowed-values TRUE FALSE))
    (slot in_mers(allowed-values TRUE FALSE))
    (slot in_franare(allowed-values TRUE FALSE))
    (slot oprit_statie(allowed-values TRUE FALSE))
    (slot nrStatie(type INTEGER))
    (slot stare))

(assert(tramvai (depou1 TRUE)(depou2 FALSE)(in_accelerare FALSE)(in_mers FALSE)(in_franare FALSE)(oprit_statie FALSE)(nrStatie 0)(stare inDepouNr1)))

(facts)

(defrule pornesteDinDepou
    ?id<-(tramvai(stare inDepouNr1)(nrStatie ?x))
    =>
    (retract ?id)
    (assert (tramvai (depou1 FALSE)(depou2 FALSE)(in_accelerare TRUE)(in_mers FALSE)(in_franare FALSE)(oprit_statie FALSE)(nrStatie ?x)(stare inAccelerare)))
    (facts))


(defrule inMers
    ?id<-(tramvai(stare inAccelerare)(nrStatie ?x))
    =>
    (retract ?id)
    (assert (tramvai (depou1 FALSE)(depou2 FALSE)(in_accelerare FALSE)(in_mers TRUE)(in_franare FALSE)(oprit_statie FALSE)(nrStatie ?x)(stare inMers)))
    (facts))

(defrule inFranare
    ?id<-(tramvai(stare inMers)(nrStatie ?x))
    =>
    (retract ?id)
    (assert (tramvai (depou1 FALSE)(depou2 FALSE)(in_accelerare FALSE)(in_mers FALSE)(in_franare TRUE)(oprit_statie FALSE)(nrStatie ?x)(stare inFranare)))
    (facts))

(defrule opritInStatie
    ;(declare (salience 10))
    ?id<-(tramvai(stare inFranare)(nrStatie ?x & :(< ?x 5)))
    =>
    (retract ?id)
    (assert (tramvai (depou1 FALSE)(depou2 FALSE)(in_accelerare FALSE)(in_mers FALSE)(in_franare FALSE)(oprit_statie TRUE)(nrStatie (++ ?x))(stare inStatie)))
    (facts))

(defrule sosesteInDepou
    ?id<-(tramvai(stare inFranare)(nrStatie ?x & :(>= ?x 5)))
    =>
    (retract ?id)
    (assert (tramvai (depou1 FALSE)(depou2 TRUE)(in_accelerare FALSE)(in_mers FALSE)(in_franare FALSE)(oprit_statie FALSE)(nrStatie ?x)(stare inDepouNr2)))
    (facts))

(run)

