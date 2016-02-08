;; Iterative

(define (square x) (* x x))

(define (even? x)
		(= (remainder x 2)
		   0))

(define (fast-expt b n)
	(define (expt-iter a b n)
		(if (= n 0)
			a
			(if (even? n)
				(expt-iter a 
						   (square b)
						   (/ n 2))
				(expt-iter (* a b) 
						   b
						   (- n 1)))))
	(expt-iter 1 b n))