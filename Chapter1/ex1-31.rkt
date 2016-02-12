;; iterative
(define (product func a next b)
	(define (product-iter a b ans)
		(if (> a b)
			ans
			(product-iter (next a) b (* ans (func a)))))
	(product-iter a b 1))

(define (inc x) (+ x 1))

(define (identity x) x)

(define (odd? x)
	(= (remainder x 2)
		1))

;; Factorial
(define (fact x)
	(product identity 1 inc x))

;;Calculate pi
(define (f x)
	(if (odd? x)
		(/ (+ x 1.)
		   (+ x 2))
		(/ (+ x 2.)
		   (+ x 1))))

(define (pi x)
	(* 4 (product f 1 inc x)))


;; Recusive
(define (product func a next b)
	(if (> a b)
		1
		(* (func a)
		   (product func (next a) next b))))