(define distance2d
  (lambda (lista_puntos1 lista_puntos2)
    (sqrt (+
           (* (- (car lista_puntos2) (car lista_puntos1)) (- (car lista_puntos2) (car lista_puntos1)))
           (* (- (cdr lista_puntos2) (cdr lista_puntos1)) (- (cdr lista_puntos2) (cdr lista_puntos1)))))))



(distance2d '(1 . 1) '(2 . 2))