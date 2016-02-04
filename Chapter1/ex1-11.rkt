;; Recursive
(define (f x)
		(if (< x 3)
			x
			(+ (f (- x 1))
			   (* 2 (f (- x 2)))
			   (* 3 (f (- x 3))))))


;; Iterative
(define (update a b c)
		(+ a
		   (* 2 b)
		   (* 3 c)))

(define (f x)
	(define (f-iter a b c i)
		(cond ((= i 0) c)
			  ((= i 1) b)
			  ((= i 2) a)
			  (else (f-iter (update a b c) a b (- i 1)))))
	(f-iter 2 1 0 x))