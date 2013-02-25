(deftemplate Persoana (multislot nume) (multislot mama) (multislot tata) (multislot partener))

(assert (Persoana(nume ion popescu)(mama nil)(tata nil)(partener maria popescu)))
(assert (Persoana(nume maria popescu)(mama nil)(tata nil)(partener ion popescu)))
(assert (Persoana(nume cristian popescu)(mama maria popescu)(tata ion popescu)(partener elena popescu)))
(assert (Persoana(nume adrian popescu)(mama maria popescu)(tata ion popescu)(partener cristina popescu)))
(assert (Persoana(nume ciprian popescu)(mama maria popescu)(tata ion popescu)(partener adriana popescu)))
(assert (Persoana(nume maria andreescu)(mama nil)(tata nil)(partener petre andreescu)))
(assert (Persoana(nume ionel andreescu)(mama maria andreescu)(tata petre andreescu)(partener nil)))
(assert (Persoana(nume tudor popescu)(tata adrian popescu)(mama cristina popescu)))

(facts)
(run)