#lang racket

(provide distance)

;; returns distance of 2 points in a cartesian graph.
;; takes coordinate pairs as arguments, example: '(x . y)
(define (distance point1 point2)
  (sqrt (+ (sqr (- (car point1)
                   (car point2)))
           (sqr (- (cdr point1)
                   (cdr point2))))))

