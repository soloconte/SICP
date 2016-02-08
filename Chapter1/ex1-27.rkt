(define (even? x)
	(= (remainder x 2)
		0))

(define (square x) (* x x))

(define (expmod x n m)
	(define (expmod-iter nn ans)
		(if (= nn 0)
			ans
			(if (even? n)
				(expmod-iter (/ nn 2)
					(remainder (square ans)
						m))
				(expmod-iter (- nn 1)
					(remainder (* ans x)
						m)))))
	(expmod-iter n 1)
)

(define (fermat x times)
	(define (test x a)
		(= (expmod a x x)
			a))
	(if (= times 0)
		#t
		(if (test x 
				(+ (random (- x 1))
					1))
			(fermat x (- times 1))
			#f)))