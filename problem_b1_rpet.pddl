(define (problem bl1_rpet)
  (:domain smart_campus)
     (:objects 
     bl1-rpet bl1-rpet-ac1 bl1-rpet-s1 bl1-rpet-s2 
     bl1-rpet-p1 bl1-rpet-t1
   ) 
  (:init
    (room bl1-rpet)
    (air-conditioner bl1-rpet-ac1)
    (switch bl1-rpet-s1)
    (switch bl1-rpet-s2)
    (projector bl1-rpet-p1)
    (temperature-sensor bl1-rpet-t1)
    (air-conditioner-on bl1-rpet-ac1)
    (switch-on bl1-rpet-s1)
    (switch-on bl1-rpet-s2)
    (in-room bl1-rpet-ac1 bl1-rpet)
    (in-room bl1-rpet-s1 bl1-rpet)
    (in-room bl1-rpet-s2 bl1-rpet)
    (in-room bl1-rpet-p1 bl1-rpet)
    (in-room bl1-rpet-t1 bl1-rpet)
    (= (occupied o1) 1) 
  )

  (:goal
    :metric minimize  (total-energy-consumed)
  )
)
