(define (list-of-values-left exps env)
(if (no-operands? exps)
'()
(let ((value (eval (first-operand exps) env)))
(cons value (list-of-values-left (rest-operands exps) env)))))

(define (list-of-values-right exps env)
(let ((result '()))
(define (iter exps)
(if (not (no-operands? exps))
(begin (iter (rest-operands exps))
(set! result (cons (eval (first-operand exps) env) result)))))
(iter exps)
result))
