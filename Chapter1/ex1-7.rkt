(define (average x y)
		(* (+ x y)
		   0.5))

(define (update guess x)
		(* (+ guess
			  (/ x guess))
			0.5))

(define (square x) (* x x))

(define (good-enough? newguess oldguess)
		(< (/ (abs (- newguess 
					  oldguess))
			  oldguess)
			0.001))

(define (sqrt-iter guess x)
		(if (good-enough? (update guess x)
						  guess)
			(update guess x)
			(sqrt-iter (update guess
							   x)
						x)))


;;using let
(define (sqrt-iter guess x)
	(let ((new-guess (update guess x)))
		(if (good-enough? new-guess guess)
			new-guess
			(sqrt-iter new-guess x))))


(define (mysqrt x) (sqrt-iter 1 x))