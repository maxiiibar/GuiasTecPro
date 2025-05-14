(define swap
  (lambda (lista)
    (if (< (length lista) 2)
        lista
        (cons (second lista)
              (cons (first lista)
                    (cddr lista))))))
    
(define agrupar
  (lambda (lista)
    (if (eqv? (cdr lista) ())
        lista
    ((if (eqv? (car lista) (car (cdr lista)))
        (cons (agrupar (cdr lista)))
        (cons (car lista) (agrupar (cdr (swap lista)))))))))
    


(agrupar '(A A B C A B A D C))