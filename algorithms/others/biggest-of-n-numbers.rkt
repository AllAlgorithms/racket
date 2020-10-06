#lang racket

(provide biggest-n)

(define (biggest-n ls)
  (apply max ls))

