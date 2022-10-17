#lang racket

; 'a list -> 'a list
; sorts a list using a merge sort algorithm
(define (merge-sort xs)
  
  ; 'a list * int -> 'a list
  ; returns the 1st n elements of xs
  (define (take xs n)
    (cond [(or (= n 0)(null? xs)) null]
          [(cons (car xs)
                 (take (cdr xs) (- n 1)))]))

  ; 'a list * int -> 'a list
  ; returns xs without its 1st n elements
  (define (drop xs n)
    (cond [(or (= n 0)(null? xs)) xs]
          [(drop (cdr xs)(- n 1))]))

  ; 'a list * 'a list -> 'a list
  ; merges and sorts both input lists into a singular list
  ; (assumes both lists are sorted)
  (define (merge xs ys)
    (cond [(null? xs) ys]
          [(null? ys) xs]
          [else
           (if (< (car xs)(car ys))
               (cons (car xs)(merge (cdr xs) ys))
               (cons (car ys)(merge xs (cdr ys))))]))

  (cond [(< (length xs) 2) xs]
        [else
         (let ([split-length (quotient (length xs) 2)])
           (merge (merge-sort (take xs split-length))
                  (merge-sort (drop xs split-length))))]))
