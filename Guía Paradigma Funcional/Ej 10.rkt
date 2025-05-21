(define largo
  (lambda (lista)
    (if (null? lista)
        0
        (+ 1 (largo (cdr lista))))))

(largo '(1 2 3 4 5 pi a b c d))

#(primer ejercicio con recursividad)