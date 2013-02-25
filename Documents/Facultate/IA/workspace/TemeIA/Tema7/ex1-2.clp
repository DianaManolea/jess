(deftemplate persoana
    (multislot nume)
    (multislot mama)
    (multislot tata)
    (multislot partener)
   )

(assert (persoana(nume ion popescu)(mama nil)(tata nil)(partener maria popescu)))
(assert (persoana(nume maria popescu)(mama nil)(tata nil)(partener ion popescu)))

(assert (persoana(nume cristian popescu)(mama maria popescu)(tata ion popescu)(partener elena popescu)))
(assert (persoana(nume adrian popescu)(mama maria popescu)(tata ion popescu)(partener cristina popescu)))
(assert (persoana(nume ciprian popescu)(mama maria popescu)(tata ion popescu)(partener adriana popescu)))
(assert (persoana(nume maria andreescu)(mama nil)(tata nil)(partener petre andreescu)))

(assert (persoana(nume ionel andreescu)(mama maria andreescu)(tata petre andreescu)(partener nil)))
(assert (persoana(nume tudor popescu)(tata adrian popescu)(mama cristina popescu)))

(facts)
(run)