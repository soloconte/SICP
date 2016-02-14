;; Fixed-point with display
;; Average Damping
(define (fixed-point func guess stop-term)
	(let ((next (/ (+ (func guess) guess) 2)))
		(display next)
		(newline)
		(if (stop-term guess next)
			next
			(fixed-point func next stop-term))))

(define (croot x)
	(fixed-point (lambda (y) (/ x (square y))) 1.0 (lambda (guess next)
					 (< (/ (abs (- guess next))
					 	   guess)
					 	0.001))))

;; Without Averge Damping
(define (fixed-point func guess stop-term)
	(let ((next (func guess)))
		(display next)
		(newline)
		(if (stop-term guess next)
			next
			(fixed-point func next stop-term))))

(define (func x)
	(/ (log 1000)
		(log x)))