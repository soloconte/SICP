(define (repeated f n)
	(define (compose f g)
		(lambda (x) (f (g x))))
	(if (= n 1)
		f
		(compose f (repeated f (- n 1)))))

(define (smooth f)
	(let ((dx 0.00001))
		 (lambda (x)
		 	(/ (+ (f (+ x dx))
		 		  (f (- x dx))
		 		  (f x))
		 	   3))))

(define (smooth-n f n)
	((repeated smooth n) f))