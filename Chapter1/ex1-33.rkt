;;filtered-accumalate, Iterative
(define (filtered-accumalate combiner null-value filter term a next b)
	(define (fa-iter x y ans)
		(if (> x y)
			ans
			(if (filter x)
				(fa-iter (next x) y (combiner (term x) ans))
				(fa-iter (next x) y ans))))
	(fa-iter a b null-value))

;;Prime
(define (square x) (* x x))

(define (prime? x)
	(define (prime-iter i)
		(if (> (square i) x)
			#t
			(if (= (remainder x i) 0)
				#f
				(prime-iter (+ i 2)))))
	(cond ((< x 2) #f)
		  ((= x 2) #t)
		  ((= (remainder x 2) 0) #f)
		  (else (prime-iter 3))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (prime-sum x y)
	(filtered-accumalate + 0 prime? identity x inc y))

;;product of relatively-prime
(define (gcd x y)
	(cond ((< x y) (gcd y x))
		  ((= y 0) x)
		  (else (gcd y (remainder x y)))))

(define (relatively-prime? x y)
	(= (gcd x y) 1))

(define (prime-product n)
	(define (rp-n? x) (relatively-prime? x n))
	(filtered-accumalate * 1 rp-n? identity 1 inc (- n 1)))