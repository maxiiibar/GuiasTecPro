(define count-elem
  (lambda(n lista)
    (if (null? lista)
            0
            (if(= n (car lista))
               (+ 1 (count-elem n (cdr lista)))
               (+ 0 (count-elem n (cdr lista)))
                ))))
          
(count-elem 3 '(1 2 3 4 5 4 3 2 3 3 3 3 3))