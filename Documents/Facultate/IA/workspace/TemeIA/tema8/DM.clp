
(defglobal ?*TASK_PRIORITY_1* = 2)
(defglobal ?*TASK_PRIORITY_2* = 1)



(deftemplate person 
    (slot firstName) 
    (slot lastName) 
    (slot age)
    (slot temperature)
    (slot lungs)
    (slot skinColor)
    (slot cough)
    (slot nasal)
    )

(facts)

(assert (person (firstName Ion)(lastName Popescu)(age 18)(temperature 39)(lungs 1)(skinColor ok)(cough T)))
(assert (person (firstName Paul)(lastName Borz)(age 20)(temperature 37)(lungs 1)(skinColor ok)(cough T)(nasal T)))
(assert (person (firstName Gheorghe)(lastName Borz)(age 20)(temperature 37)(lungs 1)(skinColor ok)(cough T)(nasal T)))
(assert (person (firstName Ionut)(lastName Marcu)(age 30)(temperature 39)(lungs 0)(skinColor ok)(cough T)(nasal F)))


(defrule gripa
?p <- (person    {temperature > 38  && 
        lungs == 1 && 
        skinColor == ok &&
         cough == T} 
        (firstName ?name)    )
=>
(printout t ?name " are gripa si are temperatura " ?p.temperature  crlf))


(defrule raceala
?p <- (person    {temperature < 38  && 
        lungs == 1 && 
        skinColor == ok &&
         cough == T &&
        nasal == T} 
        (firstName ?name)    )
=>
(printout t ?name " este racit "  crlf))


(defrule bronsita2
    (declare (salience ?*TASK_PRIORITY_2*))
    
?p <- (person    {temperature > 38  && 
        lungs == 0 && 
        skinColor == ok &&
         cough == T
        && nasal == F} 
        (firstName ?name)    )
=>
(printout t ?name " are bronsita2 "   crlf))


(defrule bronsita1
    (declare (salience ?*TASK_PRIORITY_1*))
    
?p <- (person    {temperature > 38  && 
        lungs == 0 && 
        skinColor == ok &&
         cough == T
        && nasal == F} 
        (firstName ?name)    )
=>
(printout t ?name " are bronsita1 "   crlf))


;;(defrule getbronsita
   ;     (salience (get-salience bronsita))
        

;(deffunction get-salience (?name)
 ; (bind ?s (fetch (str-cat ?name "-salience")))
 ; (if (eq ?s nil) then
  ;      (return 0)
  ; else
  ;      (return ?s)))



;(deffunction set-salience (?name, ?value)
;;  (store (str-cat ?name "-salience") ?value))

;(set-salience-evaluation every-cycle)



(run)