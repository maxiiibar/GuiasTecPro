(define mascorta
  (lambda (l1 l2)
  (if (<= (length l1) (length l2))
      l1
      l2 
      )))

#(recordar aca de que si pongo uno de los retornos entre parentesis entonces estoy indicando que se devuelve un procedimiento y en este caso solo devuelvo una lista)

(mascorta '(a b) '(c d e))
(mascorta '(a b) '(c d))
(mascorta '(a b) '(c))