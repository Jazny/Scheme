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

	;; Merge two pairs into one sorted list:
	(define (merge left_list right_list)
		;; base case: both lists are empty. return
		(if (null? right_list)
			left_list
			(if (null? left_list)
				right_list
				(if (and (null? left_list) (null? right_list))
					'()
					;; if left greater than right, 
					(if (<= (car right_list) (car left_list))
						;; append to (car right_list), recurse left_list, cdr right list.
						(append (list (car right_list)) (merge left_list (cdr right_list)))
						;; else, recursively call merge on (cdr left_list, right_list)
						(append (list (car left_list)) (merge (cdr left_list) right_list)))))))

	(if (null? l)
		'()
		(if (null? (cdr l))
			l
			(let ((splat (split l)))
				(merge (merge-sort (car splat)) (merge-sort (cdr splat)))))))
