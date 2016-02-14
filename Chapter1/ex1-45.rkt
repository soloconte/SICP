(define (repeated f n)
	(define (compose f g)
		(lambda (x) (f (g x))))
	(if (= n 1)
		f
		(compose f (repeated f (- n 1)))))

(define (average-damping f)
	(lambda (guess) (/ (+ (f guess) guess) 2)))

(define (fixed-point func guess n)
	(display guess)
	(newline)
	(let ((next (((repeated average-damping n) func) guess))
		  (stop-term (lambda (guess next)
					 (< (/ (abs (- guess next))
					 	   guess)
					 	0.001))))
		(if (stop-term guess next)
			next
			(fixed-point func next n))))

(define (square x) (* x x))

(define (even? x) (= (remainder x 2) 0))

(define (pow x n)
	(define (pow-iter x ans i)
		(if (= i 0)
			ans
			(if (even? i)
				(pow-iter (square x) ans (/ i 2))
				(pow-iter x (* x ans) (- i 1)))))
	(pow-iter x 1 n))


(define (root x n k)
	(fixed-point (lambda (y) (/ x (pow y (- n 1)))) 1.0 k))