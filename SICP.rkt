

;;; Book 1.1.7 Newton's method of successive approximations. 用牛顿逐步逼近求x的平方根

(define (sqrt x)
    (define (sqrt-iter guess)
        (if (good-enough? guess)
            guess
            (sqrt-iter (improve guess))))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (average a b)
        (/ (+ a b) 2))
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) 0.001))
    (define (abs a)
        (if (> a 0)
            a
            (- a)))   
    (sqrt-iter 1.0))
;(sqrt 2)

;;; Practice 1.7
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))
;(sqrt 9)

;;; Practice 1.8
(define (cube-iter guess x)
    (if (good-enough-cube? guess x)
        guess
        (cube-iter (improve-cube guess x) x)))
(define (good-enough-cube? guess x)
    (< (abs (- (tri guess) x)) 0.0001))
(define (tri x)
    (* x x x))   
(define (improve-cube guess x)      
    (average-cube (/ x (* guess guess)) (* 2 guess)))
(define (average-cube x y)
    (/ (+ x y) 3))

(define (cube x)
    (cube-iter 1.0 x))
;(cube 27)

;;; Practice 1.10
(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
        

(A 3 1)
(A 1 3)

;;; Ackermann Function
(define (Ac m n)
    (cond ((= 0 m) (+ 1 n))
        ((and (> m 0) (= n 0)) (Ac (- m 1) 1))
        ((and (> m 0) (> n 0)) (Ac (- m 1) (Ac m (- n 1))))))
        
;(Ac 4 1)

;;; Book 1.2.2 count change 换零钱
(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
        ((or (< amount 0) (= 0 kinds-of-coins)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)))
(define (count-change amount)
    (cc amount 5))
;(count-change 100)

;;;Practice 1.11 method1: 使用递归
(define (tri-fib1 n)
    (cond ((< n 3) n)
        (else (+ (tri-fib1 (- n 1)) 
                 (* 2 (tri-fib1 (- n 2))) 
                 (* 3 (tri-fib1 (- n 3)))))))
;(tri-fib1 10)
;;;Practice 1.11 method2: 使用迭代
(define (assign a b c)
    (+ c (* 2 b) (* 3 a)))
(define (ass a b c d n)
    (cond ((< n 3) d)
        (else (ass b c (assign a b c) (assign a b c) (- n 1)))))
(define (tri-fib2 n)
    (ass 0 1 2 n n))
;(tri-fib2 10)

;;; Hanoi-Tower
(define (Hanoi-Tower n)
    (define (Move n start mid end)
        (cond ((= 0 n) "Done")
            (else (Move (- n 1) start end mid)
                  (display start) (display "->") (display end) (display "\n")
                  (Move (- n 1) mid start end))))
    (Move n 'A 'B 'C))
;(Hanoi-Tower 3)

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

