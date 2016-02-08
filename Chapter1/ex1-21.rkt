(define (divised x y)
	(if (< x y)
		(divised y x)
		(= (remainder x y)
			0)))

(define (smallest-divisor x)
	(define (sd-iter x i)
		(if (divised x i)
			i
			(sd-iter x (+ i 1))))
	(sd-iter x 2))