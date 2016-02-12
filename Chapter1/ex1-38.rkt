(define (cont-frac n d k)
	(define (cf-iter i ans)
		(if (= i 0)
			ans
			(cf-iter (- i 1)
				(/ (n i)
					(+ (d i) ans)))))
	(cf-iter k 0))

(define (d i)
	(if (= (remainder i 3) 2)
		(* (/ (+ i 1) 3) 2)
		1))

(define (get-e k)
	(+ (cont-frac (lambda (i) 1.0) d k)
		2))