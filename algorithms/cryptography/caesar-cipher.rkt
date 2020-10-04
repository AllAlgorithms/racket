#lang racket

(provide caesar-cypher)

;; Turn plain text into cypher text with caesar cypher algorithm.
;; Numbers, symbols and whitespace are not changed.
;; args:
;;   str: string to encode
;;   shift: optional shift length, default is 3
(define (caesar-cypher str [shift 3])
  (let* ([shift-uppercase
          (lambda (c)
            (integer->char
             (+ 65 (remainder (+ shift (char->integer c) -65) 26))))]
         [shift-lowercase
          (lambda (c)
            (integer->char
             (+ 97 (remainder (+ shift (char->integer c) -97) 26))))]
         [shift
          (lambda (c)
            (cond [(and (char-alphabetic? c)
                        (char-upper-case? c))
                   (shift-uppercase c)]
                  [(and (char-alphabetic? c)
                        (char-lower-case? c))
                   (shift-lowercase c)]
                  [else c]))]
         [char-list (string->list str)])
    (let loop ([acc '()]
               [ls char-list])
      (if (null? ls)
        (list->string (reverse acc))
        (loop (cons (shift (car ls)) acc) (cdr ls))))))

