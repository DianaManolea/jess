(deftemplate elev (slot nume) (slot romana(type FLOAT)) (slot biologie(type FLOAT))
    (slot mate(type FLOAT)) (slot info(type FLOAT)))

(assert (elev(nume Tara)(romana 9.50)(biologie 5)(mate 7)(info 7)))
(assert (elev(nume Glic)(romana 9.50)(biologie 5)(mate 8)(info 7)))
(assert (elev(nume Fat)(romana 7)(biologie 7)(mate 9)(info 9.30)))
(assert (elev(nume Verse)(romana 8)(biologie 10)(mate 8)(info 7)))
(facts)

(defrule tr
    ?tehnic<- (elev { ((mate >=  8.0) && (info < 8))  || mate == 10}  )
    ?psiohologie<- (elev { ((romana >= 9) && (biologie >= 9 )) || mate < 6 && info < 7 })
    ?mateInfo<- (elev { (mate >= 9) && (info >= 9 )})
    =>
    )