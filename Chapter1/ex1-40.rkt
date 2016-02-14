(define (derive f)
	(let ((dx 0.00001))
		(lambda (x)
			(/ (- (f (+ x dx))
				  (f x))
			   dx))))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (cubic a b c)
	(lambda (x)
		(+ (cube x)
		   (* a (square x))
		   (* b x)
		   c)))

(define (newton-method f)
	(lambda (x)
		(- x
		   (/ (f x)
			  ((derive f) x)))))

(define (fixed-point func guess)
	(let ((next (/ (+ (func guess) guess) 2))
		  (stop-term (lambda (guess next)
		  					 (< (/ (abs (- guess next))
		  					 	   guess)
		  					 	0.001))))
		;;(display next)
		;;(newline)
		(if (stop-term guess next)
			next
			(fixed-point func next))))

(define (fix-point-transform f transform guess)
	(fixed-point (transform f) guess))