(define (square x) (* x x))

(define (update guess x)
		(/ (+ (/ x
				 (square guess))
			  (* 2 guess))
		   3.0))

(define (good-enough? newguess oldguess)
		(< (/ (abs (- newguess 
					  oldguess))
			  oldguess)
			0.001))

(define (cbrt-iter guess x)
		(if (good-enough? (update guess x)
						  guess)
			(update guess x)
			(cbrt-iter (update guess
							   x)
						x)))


;;using let
(define (cbrt-iter guess x)
	(let ((new-guess (update guess x)))
		(if (good-enough? new-guess guess)
			new-guess
			(cbrt-iter new-guess x))))


(define (mycbrt x) (cbrt-iter 1 x))