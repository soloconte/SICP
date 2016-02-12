(define (cube x) (* x x x))

;; sum function iterative
(define (sum func a next b)
	(define (sum-iter x y ans)
		(if (> x y)
			ans
			(sum-iter (next x) y
					  (+ ans (func x)))))
	(sum-iter a b 0))

(define (even? x)
	(= (remainder x 2)
		0))

(define (inc x) (+ x 1))

;;Simpson's Rule
(define (int f a b n)
	(define h (/ (- b a) n))
	(define (next x) (+ x 1))
	(define (func x)
		(cond ((or (= x 0)
				   (= x n))
			   (f (+ a (* x h))))
			  ((even? x)
			   (* 2 (f (+ a (* x h)))))
			  (else
			   (* 4 (f (+ a (* x h)))))))
	(* (/ h 3)
	   (sum func 0 next n)))