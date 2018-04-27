(define (cycle? lst)
(define (iter cur-ptr next-ptr cur-index next-index)
(cond ((null? cur-ptr)
#f)
((= cur-index next-index)
(iter lst (cdr next-ptr) 0 (+ next-index 1)))
((eq? cur-ptr next-ptr) #t)
(else (iter (cdr cur-ptr) next-ptr (+ cur-index 1) next-index))))
(if (null? lst)
#f
(iter lst (cdr lst) 0 1)))