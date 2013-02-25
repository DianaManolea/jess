(deftemplate is-a
    (slot who)
    (slot what)
    )
(deftemplate ako
    (slot who)
    (slot what)
    )
(deftemplate has-shape
    (slot who)
    (slot what)
    )

(assert(is-a(who good_year)(what blimp)))
(assert(is-a(who spiritOfStL)(what special)))
(assert(is-a(who AirForce1)(what DC-9)))

(assert(has-shape(who blimp)(what ellipse)))
(assert(has-shape(who ballon)(what round)))

(assert(ako(who blimp)(what ballon)))
(assert(ako(who blimp)(what Pr_driven)))
(assert(ako(who special)(what Pr_driven)))
(assert(ako(who DC-3)(what Pr_driven)))
(assert(ako(who DC-9)(what jet)))
(assert(ako(who Concorde)(what jet)))
(assert(ako(who ballon)(what Aircraft)))
(assert(ako(who Pr_driven)(what Aircraft)))
(assert(ako(who jet)(what Aircraft)))

(facts)
(defrule det-all-ako-blimp
    (ako(who special)(what ?a))
    (ako(who ?a)(what ?b))
    =>
    (printout t ?a crlf)
    (printout t ?b crlf)
    )

(run)