#lang racket

(provide leap-year?)

(define (leap-year? year)
  (let ([divisible?
         (lambda (a b) (zero? (remainder a b)))])
    (or (and (divisible? year 4)
             (not (divisible? year 100)))
        (divisible? year 400))))

