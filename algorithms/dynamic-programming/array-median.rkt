#lang racket

(provide list-median
         vector-median)

(define (list-median ls)
  (let ([ls (sort ls <)]
        [len (length ls)]
        [avg (lambda (a b) (exact->inexact (/ (+ a b) 2)))])
    (if (odd? len)
      (list-ref ls (/ (sub1 len) 2))
      (avg (list-ref ls (sub1 (/ len 2)))
           (list-ref ls (/ len 2))))))

(define (vector-median vec)
  (let ([vec (vector-sort vec <)]
        [len (vector-length vec)]
        [avg (lambda (a b) (exact->inexact (/ (+ a b) 2)))])
    (if (odd? len)
      (vector-ref vec (/ (sub1 len) 2))
      (avg (vector-ref vec (sub1 (/ len 2)))
           (vector-ref vec (/ len 2))))))

