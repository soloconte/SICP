;;Iterative
(define (accumulate combiner null-value term a next b)
	(define (ac-iter x y ans)
		(if (> x y)
			ans
			(ac-iter (next x) y (combiner (term x) ans))))
	(ac-iter a b null-value))

;;Recusive
(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a)
			(accumulate combiner null-value term (next a) next b))))

;;Sum
(define (add x y) (+ x y))
(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum term next a b)
	(accumulate add 0 term a next b))

;;Product
(define (multiply x y) (* x y))

(define (product term next a b)
	(accumulate multiply 1 term a next b))