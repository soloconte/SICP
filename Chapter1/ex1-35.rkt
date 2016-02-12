;; Fixed-point
(define (fixed-point func guess stop-term)
	(let ((next (/ (+ (func guess) guess) 2)))
		(if (stop-term guess next)
			next
			(fixed-point func next stop-term))))

(define (func x) (+ (/ 1 x) 1))

(define (close-enough? guess next)
	(< (/ (abs (- guess next))
		guess)
	   0.001))