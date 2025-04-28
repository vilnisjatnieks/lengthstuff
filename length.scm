;;************** RECURSIVE *******************************
;; recursive length function
(define (len lst)
  (cond ((null? lst)  0)
        (else       (+ 1 (len (cdr lst))))
  )
)


;;************** TAIL RECURSIVE **************************
;; helper function
(define (len-helper lst rsf)
  (cond ((null? lst)  rsf)
          (else       (len-helper (cdr lst) (+ 1 rsf)))
  )
)

;; tail recursive length function
(define (len2 lst) (len-helper lst 0))


;;************* FOLD **************************************
;; fold function
(define (fold lst base op)
  (cond ((null? lst) base)
        (else       (fold (cdr lst) (op (car lst) base) op))
  )
)

;; increment helper function
(define (inc x y) (+ 1 y))

;; fold length function
(define (len3 lst) (fold lst 0 inc))



