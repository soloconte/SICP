(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? x) 
	(= (remainder x 2)
		0))

(define (multi x y)
	(define (multi-iter x y ans)
		(if (= y 0)
			ans
			(if (even? y)
				(multi-iter (double x)
							(halve y)
							ans)
				(multi-iter x (- y 1)
							(+ ans x)))))
	(multi-iter x y 0))