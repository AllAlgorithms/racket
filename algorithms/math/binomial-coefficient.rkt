#lang racket

(provide binomial)

(define (binomial n k)
  (let ([fac (lambda (n)
               (let loop ([acc 1] [n n])
                 (if (zero? n) acc (loop (* acc n) (sub1 n)))))])
    (/ (fac n) (fac k) (fac (- n k)))))
