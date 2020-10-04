#lang racket

(provide factorial)

(define (factorial n)
  (let loop ([acc 1]
             [n n])
    (if (zero? n)
      acc
      (loop (* acc n) (sub1 n)))))

