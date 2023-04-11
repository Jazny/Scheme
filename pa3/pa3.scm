(define (list-len l)
	(if (null? l)
		0
		(+ 1 (list-len (cdr l)))))

(define (inc-list n)
	(if (= n 0)
		'()
		(append (inc-list (- n 1)) (list n))))

(define (rev-list l)
	(if (= (length l) 0)
		'()
		(append (rev-list (cdr l)) (list (car l)))))

(define (my-map f l)
	(if (null? l)
		l
		(cons (apply f (list (car l))) (my-map f (cdr l)))))

(define (merge-sort l)
    ;; Split a list into two halves, returned in a pair. You may uncomment this.
    (define (split l)
        (define (split-rec pair)
            (let ((front (car pair)) (back (cdr pair)))
                (if (>= (length front) (length back))
                    pair
                    (split-rec (cons (append front (list (car back))) (cdr back))))))
        (split-rec (cons (list (car l)) (cdr l))))

	;; base case:
	;; else, recurse:
    )
