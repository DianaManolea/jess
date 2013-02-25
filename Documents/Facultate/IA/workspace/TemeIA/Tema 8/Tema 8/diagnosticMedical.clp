(defglobal ?*prior1* = 100)
(defglobal ?*prior2* = 50)

(deftemplate pacient
    (slot nume)
    (slot temp)
    (slot smpx)
    (slot culPiele)
    (slot tusa)
    (slot smpy)
)

(assert (pacient (nume Dori)(temp 39)(smpx 1)(culPiele ok)(tusa T)))
(assert (pacient (nume Oana)(temp 37)(smpx 1)(culPiele ok)(tusa T)(smpy T)))
(assert (pacient (nume Slavic)(temp 39)(smpx 0)(culPiele ok)(tusa T)(smpy F)))

(defrule gripa
    ?p <- (pacient
        {
        	temp > 38 && smpx == 1 &&
        	culPiele == ok && tusa == T
        }
        (nume ?n))
    =>
    (printout t ?n " gripa si tmp=" ?p.temp  crlf)
)

(defrule raceala1
    (declare (salience ?*prior2*))
    ?p <- (pacient
        {
        	temp < 38  && smpx == 1 &&
        	culPiele == ok && tusa == T && smpy == T
        }
        (nume ?n))
    =>
    (printout t ?n " racit1 "  crlf)
)

(defrule raceala2
    (declare (salience ?*prior1*))
    ?p <- (pacient
        {
        	temp < 38  && smpx == 1 &&
        	culPiele == ok && tusa == T && smpy == T
        }
        (nume ?n))
    =>
    (printout t ?n " racit2 "  crlf)
)


(defrule bronsita
    
    ?p <- (pacient
        {
        	temp > 38  && smpx == 0 &&
        	culPiele == ok && tusa == T && smpy == F
       	}
        (nume ?n))
    =>
    (printout t ?n " bronsita "   crlf)
)

(run)
