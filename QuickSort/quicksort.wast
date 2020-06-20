(module
 (import "env" "memory" (memory $memory 256 256))
 (export "_getOffset" (func $_getOffset))
 (export "_quicksort" (func $_quicksort))
 (func $_quicksort (; 0 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (if
   (i32.ge_s
    (local.get $0)
    (local.get $1)
   )
   (return)
  )
  (local.set $4
   (local.get $0)
  )
  (loop $while-in
   (local.set $5
    (i32.add
     (i32.shl
      (local.get $4)
      (i32.const 2)
     )
     (i32.const 1024)
    )
   )
   (if
    (i32.lt_s
     (local.get $4)
     (local.get $1)
    )
    (block
     (local.set $0
      (local.get $1)
     )
     (local.set $3
      (local.get $4)
     )
     (loop $while-in1
      (local.set $7
       (i32.load
        (local.get $5)
       )
      )
      (loop $while-in3
       (local.set $2
        (i32.add
         (local.get $3)
         (i32.const 1)
        )
       )
       (if
        (i32.eqz
         (i32.or
          (i32.gt_s
           (local.tee $9
            (i32.load
             (local.tee $6
              (i32.add
               (i32.shl
                (local.get $3)
                (i32.const 2)
               )
               (i32.const 1024)
              )
             )
            )
           )
           (local.get $7)
          )
          (i32.gt_s
           (local.get $3)
           (local.get $1)
          )
         )
        )
        (block
         (local.set $3
          (local.get $2)
         )
         (br $while-in3)
        )
       )
      )
      (loop $while-in5
       (local.set $2
        (i32.add
         (local.get $0)
         (i32.const -1)
        )
       )
       (if
        (i32.eqz
         (i32.or
          (i32.lt_s
           (local.get $0)
           (local.get $4)
          )
          (i32.le_s
           (local.tee $10
            (i32.load
             (local.tee $8
              (i32.add
               (i32.shl
                (local.get $0)
                (i32.const 2)
               )
               (i32.const 1024)
              )
             )
            )
           )
           (local.get $7)
          )
         )
        )
        (block
         (local.set $0
          (local.get $2)
         )
         (br $while-in5)
        )
       )
      )
      (if
       (i32.lt_s
        (local.get $3)
        (local.get $0)
       )
       (block
        (i32.store
         (local.get $6)
         (local.tee $2
          (i32.add
           (local.get $9)
           (local.get $10)
          )
         )
        )
        (i32.store
         (local.get $8)
         (local.tee $2
          (i32.sub
           (local.get $2)
           (i32.load
            (local.get $8)
           )
          )
         )
        )
        (i32.store
         (local.get $6)
         (i32.sub
          (i32.load
           (local.get $6)
          )
          (local.get $2)
         )
        )
        (br $while-in1)
       )
      )
     )
    )
    (local.set $0
     (local.get $1)
    )
   )
   (local.set $2
    (i32.add
     (i32.load
      (local.tee $3
       (i32.add
        (i32.shl
         (local.get $0)
         (i32.const 2)
        )
        (i32.const 1024)
       )
      )
     )
     (i32.load
      (local.get $5)
     )
    )
   )
   (i32.store
    (local.get $3)
    (local.get $2)
   )
   (i32.store
    (local.get $5)
    (local.tee $2
     (i32.sub
      (local.get $2)
      (i32.load
       (local.get $5)
      )
     )
    )
   )
   (i32.store
    (local.get $3)
    (i32.sub
     (i32.load
      (local.get $3)
     )
     (local.get $2)
    )
   )
   (call $_quicksort
    (local.get $4)
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (br_if $while-in
    (i32.lt_s
     (local.tee $4
      (i32.add
       (local.get $0)
       (i32.const 1)
      )
     )
     (local.get $1)
    )
   )
  )
 )
 (func $_getOffset (; 1 ;) (; has Stack IR ;) (result i32)
  (i32.const 1024)
 )
)
