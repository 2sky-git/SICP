;;;Right-Split 
(define (Right-Split painter n)
    (if (= 0 n)
        painter
        (let ((smaller (Right-Split painter (- n 1))))
            (beside painter (below smaller smaller)))))
;;;Up-Split
(define (Up-Split painter n)
    (if (= 0 n)
        painter
        (let ((smaller (Up-Split painter (- n 1))))
            (below painter (beside smaller smaller)))))
;;;Corner-Split
(define (Corner-Split painter n)
    (if (= 0 n)
        painter
        (let ((up (Up-Split painter (- n 1)))
              (right (Roght-Split painter (- n 1))))
             (let ((upLeft (besides up up)
                   (blowRight (blow right right))
                   (corner (Corner-Split painter (- n 1)))))
                 (beside (blow painter upLeft) 
                         (blow blowRight corner))))))
;;;Square-limit
(define (Square-Limit painter n)
    (let ((cornerSplit (Corner-Split painter (- n 1)))
        (let ((half (beside cornerSplit (Flip-Horiz cornerSplit)))
            (beside half (Flip-Horiz half)))))))

;;;Square-Of-Four
(define (Square-Of-Four ul ur bl br)
    (lambda (painter)
            ((let ((upHalf) (beside (ul painter) (ur painter))
                   (blowHalf) (beside (bl painter) (br painter)))
                (bolw blowHalf upHalf)))))

;;;Square-Pairs,定义了一个过程，命名为Square-Pairs 
(define Square-Pairs 
        (Square-Of-Four identify Flip-Horiz identify Flip-Horiz))
        
;;;Square-limit2
(define (Square-limit2 painter n)
    (let ((combine4 (Square-Of-Four Flip-Horiz identify Rotate180 Flip-Vert)) ;;定义了一个新过程combine4
        (combine4 (Corner-Split painter n)))))