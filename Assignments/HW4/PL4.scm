(define (reverseList lst)
(COND
((NULL? lst) lst)
(ELSE (APPEND (reverseList(CDR lst)) (LIST (CAR lst))))
))

(define (union l1 l2)
  (cond ((null? l2) l1)
        ((member (car l2) l1)
         (union l1 (cdr l2)))
        (else (union (cons (car l2) l1) (cdr l2)))))


(DEFINE (insert item list)
    (COND
            ((NULL? list) (CONS item '()))
            ((< item (CAR list)) (CONS item list))
            (ELSE (CONS (CAR list) (insert item (CDR list))))
    )
)
 
(DEFINE (insertionSort list)
  (IF (NULL? list)'()
    (insert (CAR list) (insertionSort (CDR list)))
  )
)

(define (maxmin L)
  (COND 
    ((null? L) '()) 
    ((null? (cdr L)) (list (car L) (car L))) 
    (else (let((maxmintemp(maxmin (cdr L))) (temp (car L)) )
            (cond(( > temp (car maxmintemp)) (cons temp(cdr maxmintemp)))
                 (( < temp (cadr maxmintemp)) (list (car maxmintemp) temp))
                 (else maxmintemp))))))

(define (perm s)
  (cond ((null? s) '())
	((null? (cdr s)) (list s))
	(else (let splice ((l '()) (m (car s)) (r (cdr s)))
	    (append
	      (map (lambda (l1) (cons m l1)) (perm (append l r)))
	      (if (null? r) '()
		(splice (cons m l) (car r) (cdr r))))))))


