;;Iterative

(define (cont-frac n d k)
	(define (cf-iter i ans)
		(if (= i 0)
			ans
			(cf-iter (- i 1)
				(/ (n i)
					(+ (d i) ans)))))
	(cf-iter k 0))

;; Recursive
(define (cont-frac n d k)
	(define (cf-rec i)
		(if (= i k)
			(/ (n i)
				(d i))
			(/ (n i)
			   (+ (d i)
			   	  (cf-rec (+ i 1))))))
	(cf-rec 1))