(define area_circulo
  (lambda (radio)
    (* radio radio pi)))

(area_circulo 3)
(area_circulo 1)
(area_circulo 0)
(area_circulo 10)
(area_circulo pi)

#(acordarse de que los identificadores se evaluan a no ser que tengan un quote o un apostrofe, en este caso pi es un identificador)