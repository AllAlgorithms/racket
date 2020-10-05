#lang racket

(provide average)

(define (average ls)
  (exact->inexact
   (/ (foldl + 0 ls)
      (length ls))))
