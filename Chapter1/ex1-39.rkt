(define (cont-frac n d k)
	(define (cf-iter i ans)
		(if (= i 0)
			ans
			(cf-iter (- i 1)
				(/ (n i)
					(+ (d i) ans)))))
	(cf-iter k 0))

(define (square x) (* x x))

(define (n x)
	(lambda (i)
		(if (= i 1)
			x
			(- (square x)))))

(define (d i) (- (* 2 i) 1))

(define (tan-cf x k)
	(cont-frac (n x) d k))