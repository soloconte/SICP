(define (iterative-improve good-enough? improve)
	(define (try x)
			(let ((next (improve x)))
				(if (good-enough? x next)
					next
					(try next))))
	(lambda (x) (try x)))

(define (close-enough? x next)
	(< (/ (abs (- x next)) x) 0.001))

;; Square Root 
(define (sqrt x)
	(let ((improve (lambda (y) (/ (+ (/ x y) y) 2))))
		 ((iterative-improve close-enough? improve) 1.0)))

;; Fixed-Point
(define (fixed-Point f)
	(let ((improve (lambda (x) (/ (+ (f x) x) 2))))
		 ((iterative-improve close-enough? improve) 1.0)))