(deftemplate intrebare (slot text) (slot tip) (multislot valid) (slot ident)) 
(deftemplate raspuns (slot ident) (slot text))
(deftemplate intreaba (declare (ordered TRUE)))
(deftemplate verifica (declare (ordered TRUE)))

(do-backward-chaining raspuns)

(deffacts MAIN::intrebari
    (intrebare (ident hardware) 
      (tip multi) (valid x86 Macintosh altele) 
      (text "Ce tip de hardware aveti?")) 
    (intrebare 
      (ident sunet) (tip multi) (valid da nu) 
      (text "Scoate computerul vreun sunet?")) 
    (intrebare 
      (ident priza) (tip multi) (valid da nu) 
      (text "Este computerul bagat in priza?")) 
    (intrebare 
      (ident hard) (tip multi) (valid da nu) 
      (text "Se aud sunete dinspre hard-disk?")) 
    (intrebare 
      (ident piuit) (tip multi) (valid da nu) 
      (text "Se aud sunete asemanatoare unui piuit?")) 
    (intrebare 
      (ident numar-piuituri) (tip numar) (valid) 
      (text "De cate ori piuie?")) 
    (intrebare 
      (ident ram-miscat) (tip multi) (valid da nu) 
      (text "Este vreo placuta de RAM miscata din slot?")) 
    (intrebare 
      (ident incepe-boot) (tip multi) (valid da nu) 
      (text "Incepe boot-area?"))
    (MAIN::intreaba hardware) ) 

(deffunction recomanda-actiune (?actiune)
    (printout t "Va recomand sa " ?actiune crlf)) 

(defrule MAIN::arhitectura 
    (declare (auto-focus TRUE)) 
    (explicit (raspuns (ident hardware) (text ~x86))) 
    => 
    (recomanda-actiune "consultati un expert uman") 
    (halt)) 

(defrule MAIN::scos-din-priza 
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text nu)) 
    (raspuns (ident priza) (text nu)) 
    => 
    (recomanda-actiune "bagati computerul in priza") 
    (halt)) 

(defrule MAIN::defectiune-sursa 
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text nu)) 
    (raspuns (ident priza) (text da)) 
    => 
    (recomanda-actiune "reparati sau inlocuiti sursa") 
    (halt)) 

(defrule MAIN::verifica-ram 
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text da)) 
    (raspuns (ident hard) (text nu)) 
    (raspuns (ident piuit) (text da)) 
    (raspuns (ident numar-piuituri) (text ?t)) 
    (test (< (integer ?t) 3)) 
    => 
    (assert (verifica ram-miscat)) 
    (recomanda-actiune "verificati placutele de RAM, apoi continuati")) 

(defrule MAIN::sunet-necunoscut
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text da)) 
    (raspuns (ident hard) (text nu)) 
    (raspuns (ident piuit) (text nu)) 
    => 
    (recomanda-actiune "consultati un expert uman") 
    (halt)) 

(defrule MAIN::placa-de-baza-sau-tastatura
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text da)) 
    (raspuns (ident hard) (text nu)) 
    (raspuns (ident piuit) (text da)) 
    (raspuns (ident numar-piuituri) (text ?t)) 
    (test (>= (integer ?t) 3)) 
    => 
    (recomanda-actiune "verificati tastatura si placa de baza") 
    (halt)) 

(defrule MAIN::nu-boot 
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text da)) 
    (raspuns (ident hard) (text da)) 
    (raspuns (ident incepe-boot) (text nu)) 
    => 
    (recomanda-actiune 
    "verificati tastatura, placutele RAM, placa de baza si sursa") 
    (halt)) 

(defrule MAIN::boot
    (declare (auto-focus TRUE)) 
    (raspuns (ident sunet) (text da)) 
    (raspuns (ident hard) (text da)) 
    (raspuns (ident incepe-boot) (text da)) 
    => 
    (recomanda-actiune "consultati un expert in software")
    (halt)) 

(defrule MAIN::ram-miscat 
    (declare (auto-focus TRUE)) 
    (verifica ram-miscat) 
    (raspuns (ident ram-miscat) (text da)) 
    => 
    (recomanda-actiune "scoateti si reasezati placutele RAM") 
    (halt)) 

(defrule MAIN::ram-defect 
    (declare (auto-focus TRUE)) 
    (verifica ram-miscat) 
    (raspuns (ident ram-miscat) (text nu)) 
    => 
    (recomanda-actiune 
    "inlocuiti placutele RAM, una cate una si testati din nou") 
    (halt)) 

(defmodule declansare) 

(defrule declansare::da-raspuns 
    (declare (auto-focus TRUE)) 
    (MAIN::need-raspuns (ident ?id)) 
    (not (MAIN::raspuns (ident ?id))) 
    (not (MAIN::intreaba ?)) 
    => 
    (assert (MAIN::intreaba ?id))
    (return))

(defmodule intreaba)

(deffunction este-numar (?value) 
    (try 
      (integer ?value) 
      (return TRUE) 
    catch 
      (return FALSE))) 

(deffunction este-de-tip (?raspuns ?tip ?valid)
    (if (eq ?tip multi) then 
      (foreach ?item ?valid 
        (if (eq (sym-cat ?raspuns) (sym-cat ?item)) then 
          (return TRUE))) 
      (return FALSE)) 

    (if (eq ?tip numar) then 
      (return (este-numar ?raspuns))) 

    (return (> (str-length ?raspuns) 0))) 

(deffunction intreaba-utilizator (?intrebare ?tip ?valid)
    (bind ?raspuns "") 
    (while (not (este-de-tip ?raspuns ?tip ?valid)) do 
      (printout t ?intrebare " ") 
      (if (eq ?tip multi) then 
        (printout t crlf "Raspunsurile valide sunt ") 
        (foreach ?item ?valid 
          (printout t ?item " ")) 
        (printout t ": ")) 
      (bind ?raspuns (read))) 
    (return ?raspuns)) 

(defrule intreaba::intreaba-dupa-id 
    (declare (auto-focus TRUE)) 
    (MAIN::intrebare (ident ?id) (text ?text) 
                    (valid $?valid) (tip ?tip)) 
    (not (MAIN::raspuns (ident ?id))) 
    ?intreaba <- (MAIN::intreaba ?id) 
    => 
    (retract ?intreaba) 
    (bind ?raspuns (intreaba-utilizator ?text ?tip ?valid)) 
    (assert (raspuns (ident ?id) (text ?raspuns))) 
    (return)) 

(reset)
(run)