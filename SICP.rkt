
; a b分别为下限和上限
(define (Sum Term a Next b)
    (if (< b a)
    0
    (+ (Term a)
       (Sum Term
            (Next a)
            Next
            b))))
(define (Sum-Int a b)
    (define (Identify X) X)
    (Sum Identify
        a
        1+
        b))
(Sum-Int 2 3)
(define (Sum-Square a b)
    (Sum square
        a
        1+
        b))
(Sum-Square 2 3)
(define (Sum-Pi a b)
    (Sum (lambda (i) (/ 1 (* i (+ i 2))))
         a
         (lambda (i) (+ 4 i))
         b))
(Sum-Pi 2 5)

(define (Average a b)
    (/ (+ a b) 2))

(define (Fixed-Point F start)
    (define (Iter old new)
        (if (Close-Enough? old new)
        new
        (Iter new (F new))))
    (define (Close-Enough? old new)
        (< abs(- old new) tolerance))
    (define tolerance 0.0001)
    (Iter start (F start)))



(define (Newton F guess)
    (define DF (Deciv F))
    (Fixed-Point 
        (lambda (x) (- x (/ (F x) (DF x))))
        guess))
        
(define dx 0.00001)
(define Deciv
    (lambda (f)  ;;接受一个函数f为参数
        (lambda (x) ;;产生一新的procedure作为输出
            (\ (- (f (+ x dx)) (f x)) dx))) 
    )

(define (Sqrt x)
    (Newton 
        (lambda (y) (- x (Square y)))
        1))
(Sqrt 9)

