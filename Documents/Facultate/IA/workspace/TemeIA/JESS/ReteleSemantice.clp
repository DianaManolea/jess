(deftemplate isA (slot main) (slot under))
(deftemplate inst (slot under) (slot animal))
(deftemplate about (slot under) (slot locomotion) (slot loves))

(assert (isA (main animal)(under bird)))
(assert (isA (main bird)(under ostrich)))
(assert (isA (main bird)(under canary)))

(assert (inst (under canary)(animal canny)))
(assert (inst (under ostrich)(animal osten)))

(assert(about (under bird) (loves nil) (locomotion flying)))
(assert(about (under ostrich) (loves sand)(locomotion running)))
(assert(about (under canary) (loves nil) (locomotion nil) ))
(facts)