(defglobal ?*TASK_PRIORITY_1* = 500)
(defglobal ?*TASK_PRIORITY_2* = 200)


(deftemplate animal 
    (slot denumire)
    (slot mancare) ; vegetarian carnivor
    (slot modViata);diurn nocturn 
    (slot mediuViata); acvatic semiacvatic terestru erian
    (slot modalitateReproducere); pui oua
    (slot zona)
    (slot medieViata)
    (slot putere);0 la ierbivore 1,2
    
    )

(facts)

(assert (animal 
        (denumire leu)
        (mancare carnivor)
        (putere 2)))
(assert (animal 
        (denumire hiena)
        (mancare carnivor)
        (putere 1)))
(assert (animal 
        (denumire caprioara)
        (mancare vegetarian)
        ))

(assert (animal 
        (denumire broasca)
        (mancare vegetarian)
        (modViata diurn)
        (mediuViata semiacvatic)
        (modalitateReproducere oua)))

(assert (animal 
        (denumire ariciMare)
        (mancare vegetarian)
        (modViata diurn)
        (mediuViata semiacvatic)
        (zona mediteraniana)))

(assert (animal 
        (denumire foca)
        (zona polara)))

(assert (animal 
        (denumire ursPolar)
        (zona polara)))

;; Wikipedia defines an anti-pattern as a frequently occurring programming
;; mistake or problem which is avoided by following best-practices. 
;;Anti-patterns encompass pitfalls, traps, dead-ends, 
;;and other poor implementation ideas that ultimately fail. 

;;presupunem ca anti pattern afisare foca si urs polar un
;;defrule care cauta in toata memoria jess de facts 
;;foca si ursul polar desi stie ca exista doar un urs si o foca


(defrule antipattern
    
?p <- (animal    { zona == polara } 
        (denumire ?name)    )
=> 
    
( printout t " *** Animale polare " ?name crlf))


;;
(defrule MediuSemiacvatic
    (declare (salience ?*TASK_PRIORITY_1*))
?p <- (animal    {mediuViata == semiacvatic} 
        (denumire ?name)    )
=>
(printout t  " *** Animalul care are mediul de viata semiacvatic este " ?name crlf))

(defrule rule2
    (declare (salience ?*TASK_PRIORITY_2*))
?p <- (animal    {mancare == vegetarian && zona == mediteraniana } 
        (denumire ?name)    )
=>
(printout t  " *** Animalul care e vegetarian si traieste in zona mediteraniana este " ?name crlf))


;( mancare == animal1.mancare && mancare == carnivor )

(defrule pradator-prada
?animal1 <- (animal) 
    ;(bind ?m1 animal1.mancare)
?animal2 <- (animal {mancare == 
         animal1.mancare 
         && mancare == carnivor
        && 
        (  putere < animal1.putere  
           ; || animal1.mancare == vegetarian
             )})
?animal3 <- (animal { mancare == carnivor  } )
    ?animal4 <- (animal { mancare == vegetarian  } )
=> 
    ( printout t " *** Pradatorul este " ?animal1.denumire " si prada " ?animal2.denumire crlf)
( printout t " *** Pradatorul: " ?animal3.denumire " si prada: " ?animal4.denumire crlf))

(run)