(define tolerance 0.00001)

(define (average x y) 
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
(display guess)
(newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (log-1000)
(fixed-point
(lambda (x) (/ (log 1000) (log x)))
2.0))

(define (average-log-1000)
(fixed-point
(lambda (x) (average x (/ (log 1000) (log x))))
2.0))
