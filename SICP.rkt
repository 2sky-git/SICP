(define (Integral-E f a b n)
    (define (Next k)
        (+ 1 k))
    (define h (/ (- b a) n))
    (define (Term k)
        (* (y k) (factor k)))
    (define (y k)
        (f (+ a (* k h))))
    (define (factor k)  
        (cond ((or (= k 1) (= k n)) 1)
            ((even? k) 2)
            (else 4)))
    (if (not (even? n))
            (error "n can't be odd")
            (* (/ h 3)
               (Sum Term
                    (exact->inexact 0)
                    Next
                    n))))   







;;;;
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

