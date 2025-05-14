(define subst
  (lambda (n1 n2 lista)
    (if (null? lista)
         '()
         (if (eqv? n1 (car lista))
             (cons n2 (subst n1 n2 (cdr lista)))
             (cons (car lista) (subst n1 n2 (cdr lista)))
    ))))



(subst 'c 'k '(c o c o n u t))