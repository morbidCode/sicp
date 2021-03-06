(define (make-joint account password another-password)
(lambda (user-password m)
(if (eq? user-password another-password)
(account password m)
(error "Incorrect password"))))

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch user-password m)
(if (eq? user-password password)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: 
                 MAKE-ACCOUNT" m)))
(error "Incorrect password")))
  dispatch)
