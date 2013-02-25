(deftemplate persoana
    (slot culoaraCasa) (slot nrCasa) (slot nationalitate) (slot animal) (slot bautura) (slot tigari))

(foreach ?culoareCasa (create$ albastra rosie verde galbena alba)
    ;   (foreach ?nrCasa (create$ 1 2 3 4 5)
    (foreach ?nationalitate (create$ suedez englez danez norvegian german)
        (foreach ?animal (create$ caine pasare pisica cal peste)
            (foreach ?bautura (create$ lapte cafea ceai bere apa)
                (foreach ?tigari (create$ PallMall Dunhill Blend BlueMasters Prince)
                    (assert (persoana (culoaraCasa ?culoareCasa)
                            (nationalitate ?nationalitate) (animal ?animal) (bautura ?bautura)
                            (tigari ?tigari)))
                    )))))
;(facts)

(defrule rezolvare
    ?id1<- (persoana (culoaraCasa ?cul1)
        (nrCasa 1)
        (nationalitate ?nat1 & norvegian)
        (animal ?anim1)
        (bautura ?b1)
        (tigari ?tig1))
   
    (persoana (culoaraCasa ?c1 & rosie) (nrCasa ?nr1) (nationalitate ?n1 & englez) (animal ?a1) (bautura ?b1) (tigari ?t1))
    (persoana (culoaraCasa ?c2 & ~?c1) (nrCasa ?nr2 & ~?nr1) (nationalitate ?n2 & suedez & ~?n1) 
        (animal ?a2 & caine & ~?a1) (bautura ?b2 & ~?b1) (tigari ?t2 & ~?t1))
    (persoana (culoaraCasa ?c3 & ~?c2 & ~?c1) (nrCasa ?nr3 & ~?nr2 & ~?nr1) (nationalitate ?n3 & danez & ~?n2 & ~?n1) 
        (animal ?a3 & ~?a2 & ~?a1) (bautura ?b3 & ceai & ~?b2 & ~?b1) (tigari ?t3 & ~?t2 & ~?t1))
    (persoana (culoaraCasa ?c4 & verde & :(- 1 ?c3 & alba) & ~?c3 & ~?c2 & ~?c1) (nrCasa ?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n4 & ~?n3 & ~?n2 & ~?n1) (animal ?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b4 & cafea & ~?b3 & ~?b2 & ~?b1) (tigari ?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (culoaraCasa ?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) (nrCasa ?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) (animal ?a5 & pasare & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) (tigari ?t5 & PallMall & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (culoaraCasa ?c6 & galbena & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n6 & ~?n5 & ~?n4& ~?n3& ~?n2 & ~?n1) 
        (animal ?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t6 & Dunhill & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (nrCasa ?nr8))
    (persoana (animal ?pisica & pisica))
    (persoana (culoaraCasa ?c7 & ~?c6 & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr7 & :(- 1 ?nr6 :(+ 1 ?nr8))  & ~?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n7 & ~?n6 & ~?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) 
        (animal ?a7 & ~?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b7 & ?pisica & ~?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t7 & Blend & ~?t6 & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (culoaraCasa ?c8 & ~?c7& ~?c6 & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr8 & ~?nr7 & ~?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n8 & ~?n7 & ~?n6 & ~?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) 
        (animal ?a8 & ~?a7 & ~?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b8 & bere & ~?b7 & ~?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t8 & BlueMasters & ~?t7 & ~?t6 & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (nrCasa ?nr10))
    (persoana (culoaraCasa ?c9 & :(- 1 ?c6 :(+ 1 ?c6)) & ~?c8 & ~?c7& ~?c6 & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr9 & :(- 1 ?nr8 :(+ 1 ?nr10)) & ~?nr8 & ~?nr7 & ~?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n9 & ~?n8 & ~?n7 & ~?n6 & ~?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) 
        (animal ?a9 & cal & ~?a8 & ~?a7 & ~?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b9 & ~?b8 & ~?b7 & ~?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t9 & ~?t8 & ~?t7 & ~?t6 & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (culoaraCasa ?c10 & ~?c9 & ~?c8 & ~?c7& ~?c6 & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr10 & ~?nr9 & ~?nr8 & ~?nr7 & ~?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n10 & german & ~?n9 & ~?n8 & ~?n7 & ~?n6 & ~?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) 
        (animal ?a10 & ~?a9 & ~?a8 & ~?a7 & ~?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b10 & ~?b9 & ~?b8 & ~?b7 & ~?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t10 & Prince & ~?t9 & ~?t8 & ~?t7 & ~?t6 & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (nrCasa ?nr12))
    (persoana (culoaraCasa ?c11 & ~?c10 & ~?c9 & ~?c8 & ~?c7& ~?c6 & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr11 & :(- 1 ?nr10 :(+ 1 ?nr11)) & ~?nr10 & ~?nr9 & ~?nr8 & ~?nr7 & ~?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n11 & ~?n10 & ~?n9 & ~?n8 & ~?n7 & ~?n6 & ~?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) 
        (animal ?a11 & ~?a10 & ~?a9 & ~?a8 & ~?a7 & ~?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b11 & ~?b10 & ~?b9 & ~?b8 & ~?b7 & ~?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t11 & Blend & ~?t10 & ~?t9 & ~?t8 & ~?t7 & ~?t6 & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (culoaraCasa ?c11 & ~?c10 & ~?c9 & ~?c8 & ~?c7& ~?c6 & ~?c5 & ~?c4 & ~?c3 & ~?c2 & ~?c1) 
        (nrCasa ?nr11 & ~?nr10 & ~?nr9 & ~?nr8 & ~?nr7 & ~?nr6 & ~?nr5 & ~?nr4 & ~?nr3 & ~?nr2 & ~?nr1) 
        (nationalitate ?n11 & ~?n10 & ~?n9 & ~?n8 & ~?n7 & ~?n6 & ~?n5 & ~?n4 & ~?n3 & ~?n2 & ~?n1) 
        (animal ?a11 & ~?a10 & ~?a9 & ~?a8 & ~?a7 & ~?a6 & ~?a5 & ~?a4 & ~?a3 & ~?a2 & ~?a1) 
        (bautura ?b11 & ~?b10 & ~?b9 & ~?b8 & ~?b7 & ~?b6 & ~?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1) 
        (tigari ?t11 & ~?t10 & ~?t9 & ~?t8 & ~?t7 & ~?t6 & ~?t5 & ~?t4 & ~?t3 & ~?t2 & ~?t1))
    (persoana (bautura ?apa & apa))
    
    ?id2<- (persoana (culoaraCasa ?cul2 & albastra & ~?cul1)
        (nrCasa 2)
        (nationalitate ?nat2 & ~?nat1)
        (animal ?anim2 & ~?anim1)
        (bautura ?b2 & ~?b1)
        (tigari ?tig2 & ~?tig1))
    ?id3<- (persoana (culoaraCasa ?cul3 & ~?cul2 & ~?cul1)
        (nrCasa 3)
        (nationalitate ?nat3 & ~?nat2 & ~?nat1)
        (animal ?anim3 & ~?anim2 & ~?anim1)
        (bautura ?b3 & lapte & ~?b2 & ~?b1)
        (tigari ?tig3 & ~?tig2 & ~?tig1))
    ?id4<- (persoana (culoaraCasa ?cul4 & ~?cul3 & ~?cul2 & ~?cul1)
        (nrCasa 4)
        (nationalitate ?nat4 & ~?nat3 & ~?nat2 & ~?nat1)
        (animal ?anim4 & ~?anim3 & ~?anim2 & ~?anim1)
        (bautura ?b4 &~?b3 & ~?b2 & ~?b1)
        (tigari ?tig4 & ~?tig3 & ~?tig2 & ~?tig1))
    ?id5<- (persoana (culoaraCasa ?cul5 & ~?cul4 & ~?cul3 & ~?cul2 & ~?cul1)
        (nrCasa 5)
        (nationalitate ?nat5 & ~?nat4 & ~?nat3 & ~?nat2 & ~?nat1)
        (animal ?anim5 & ~?anim4 & ~?anim3 & ~?anim2 & ~?anim1)
        (bautura ?b5 & ~?b4 & ~?b3 & ~?b2 & ~?b1)
        (tigari ?tig5 & ~?tig4 & ~?tig3 & ~?tig2 & ~?tig1))
    
    =>
    (printout t "Casa 1 are culoarea " ?cul1 " locuieste un " ?nat1
        " are ca animal " ?anim1 " bea " ?b1 " fumeaza " ?tig1)
    (printout t "Casa 2 are culoarea " ?cul2 " locuieste un " ?nat2
        " are ca animal " ?anim2 " bea " ?b2 " fumeaza " ?tig2)
    (printout t "Casa 3 are culoarea " ?cul3 " locuieste un " ?nat3
        " are ca animal " ?anim3 " bea " ?b3 " fumeaza " ?tig3)
    (printout t "Casa 4 are culoarea " ?cul4 " locuieste un " ?nat4
        " are ca animal " ?anim4 " bea " ?b4 " fumeaza " ?tig4)
    (printout t "Casa 5 are culoarea " ?cul5 " locuieste un " ?nat5
        " are ca animal " ?anim5 " bea " ?b5 " fumeaza " ?tig5)
    (retract ?id1)
    (retract ?id2)
    (retract ?id3)
    (retract ?id4)
    (retract ?id5)
    )
(run)
