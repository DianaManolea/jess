(deftemplate persoana(slot nume)(slot tata)(slot mama))

(deftemplate soti(slot sot)(slot sotie))

(deffacts persoane
    (persoana (nume IonPopescu)(tata null)(mama null))
    (persoana (nume MariaPopescu)(tata null)(mama null))
    (persoana (nume MariaAndreescu)(tata IonPopescu)(mama MariaPopescu))
    (persoana (nume CristianPopescu)(tata IonPopescu)(mama MariaPopescu))
    (persoana (nume AdrianPopescu)(tata IonPopescu)(mama MariaPopescu))
    (persoana (nume CiprianPopescu)(tata IonPopescu)(mama MariaPopescu))
    (persoana (nume PetreAndreescu)(tata null)(mama null))
    (persoana (nume ElenaPopescu)(tata null)(mama null))
    (persoana (nume CristinaPopescu)(tata null)(mama null))
    (persoana (nume AdrianaPopescu)(tata null)(mama null))
    (persoana (nume TudorPopescu)(tata AdrianPopescu)(mama CristinaPopescu))
    (persoana (nume IonelAndreescu)(tata PetreAndreescu)(mama MariaAndreescu))
)

(deffacts sotii
    (soti (sot IonPopescu)(sotie MariaPopescu))
    (soti (sot MariaAndreescu)(sotie PetreAndreescu))
    (soti (sot CristianPopescu)(sotie ElenaPopescu))
    (soti (sot AdrianPopescu)(sotie CristinaPopescu))
    (soti (sot CiprianPopescu)(sotie AdrianaPopescu))
)

(reset)
(facts)