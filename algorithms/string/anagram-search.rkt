#lang racket

(provide anagram?)

;; checks if 2 strings are anagrams regardless of whitespace
(define (anagram? str1 str2)
  (let ([not-ws?
         (lambda (c) (not (char-whitespace? c)))])
    (equal? (sort (filter not-ws? (string->list str1)) char<?)
            (sort (filter not-ws? (string->list str2)) char<?))))

