(define (domain smart_campus)
  (:requirements :strips)
  

    (:predicates
    (room ?r)
    (air-conditioner ?ac)
    (switch ?s)
    (projector ?p)
    (air-conditioner-on ?ac)
    (switch-on ?s)
    (projector-on ?p)
    (temperature-sensor ?t) 
    (in-room ?d ?r)
    (occupancy ?o)
    (energy-consumed ?energy)
  )

  (:functions
    (occupied ?o - occupancy)
    (total-energy-consumed)
    (time)
    (current-temperature ?r - room)
    (ac-set-temperature ?ac - air-conditioner)
  )

  (:action turn-off-switch
    :parameters (?r  ?o  ?s )
    :precondition (and (room ?r)
                       (occupancy ?o)
                       (switch ?s)
                       (in-room ?s ?r)
                       (= (occupied ?o) 0)
                       (switch-on ?s))
    :effect (not (switch-on ?s))
  )

  (:action turn-on-switch
    :parameters (?r ?o ?s)
    :precondition (and (in-room ?s ?r)
                       (= (occupied ?o) 1)
                       (switch-on ?s))
    :effect (not (switch-on ?s))
  )

  (:action turn-on-air-conditioner
    :parameters (?r ?o ?ac)
    :precondition (and (in-room ?ac ?r)
                       (=(occupied ?o) 1)
                       (not (air-conditioner-on ?ac)))
    :effect (and (air-conditioner-on ?ac)
  )

  (:action turn-off-air-conditioner
    :parameters (?r ?o ?ac)
    :precondition (and (in-room ?ac ?r)
                       (= (occupied ?o) 0)
                       (air-conditioner-on ?ac))
    :effect (not (air-conditioner-on ?ac))
  )

  (:action turn-on-projector
    :parameters (?r ?o ?p)
    :precondition (and (in-room ?p ?r)
                       (>= (occupied ?o) 1)
                       (not (projector-on ?p)))
    :effect (and (projector-on ?p)
  )

  (:action turn-off-projector
    :parameters (?r ?o ?p)
    :precondition (and (in-room ?p ?r)
                  (= (occupied ?o) 0)
                  (projector-on ?p))
    :effect (not (projector-on ?p))
  )


  (:durative-action turn-off-air-conditioner-lunchbreak
    :parameters (?ac ?r)
    :duration (= ?duration 3600)
    :precondition (and
      (ar-conditioner ?ac) (room ?r) (device-in-room ?ac ?r)
      (at start (and (occupied ? o) = 0) (air-conditioner-on ?ac) (>= (time) 43200) (<= (time) 46800)))
      (over all (not (air-conditioner-on ?ac)))
      (at end (air-conditioner-on ?ac))
    )
    :effect (and (at start (not (in-use ?ac)))
                 (at end (in-use ?ac)))
  )

  (:durative-action turn-off-switch-lunckbreak
    :parameters (?l  ?r)
    :duration (= ?duration 3600)
    :precondition(and
        (switch ?s)(room ?r) (in-room ?s ?r)
        (at start (and  (switch-on ?l) (>= (time) 43200) (<= (time) 46800)))
        (over all (not (switch-on ?l)))
        (at end (switch-on ?l))
    )
    :effect (and (at start (not (switch-on ?l)))
                 (at end (switch-on ?l)))
  )

  (:durative-action wait-turn-off-projector-after-class
    :parameters (?p ?r)
     :duration (= ?duration 900)
    :condition (and
        (projector ?p) (room ?r) (in-room ?p ?r))
      (at start (and  (projector-on ?p) (= (time) 43200)))
      (over all (in-use ?p))
      (at end (in-room ?p ?r))
    )
    :effect (at end (not (projector-on ?p)))
  )
)