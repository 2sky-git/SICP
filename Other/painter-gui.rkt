#lang racket/gui

;; 1. Setting up the drawing infrastructure specific to PLT Racket.
(define size-x 500)
(define size-y 500)
(define picture (make-object bitmap% size-x size-y))
(define bm-dc (make-object bitmap-dc% picture))
(send bm-dc clear)
(define frame-gui (new frame% 
                       [label "Picture Language"]
                       [width (+ size-x 10)]
                       [height (+ size-y 35)]))
(define canvas (new canvas%
                    [parent frame-gui]
                    [paint-callback
                     (lambda (canvas dc)
                       (send dc draw-bitmap picture 0 0))]))
(define (draw-line v1 v2)
  (send bm-dc 
        draw-line 
        (* size-x (xcor-vect v1)) 
        (- size-y (* size-y (ycor-vect v1)))
        (* size-x (xcor-vect v2))
        (- size-y (* size-y (ycor-vect v2)))))
(send frame-gui show #t)
;; -------------------------------------------------------------------------

;; 2. Implementation of the data abstraction.
;; 2.1 frame
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame F)(car F))
(define (edge1-frame F) (cadr F))
(define (edge2-frame F) (caddr F))

;; 2.2 vect
(define (make-vect x y) (cons x y))
(define (xcor-vect V) (car V))
(define (ycor-vect V) (cdr V))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))
(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

;; 2.3 segment
(define (make-segment start end) (cons start end))
(define (start-segment S) (car S))
(define (end-segment S) (cdr S))

;; 2.4 映射函数
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))
;; -------------------------------------------------------------------------

;; 3. 定义画家
(define (foreach proc L)
  (if (not (null? L))
      (begin
        (proc (car L))
        (foreach proc (cdr L)))
        (newline)))

;; 3.1 会画线段的画家
(define (segments->painter segment-list)
  (lambda (frame)
    (foreach
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;; 3.2 定义frame
(define O0 (make-vect 0 0)) ;;;定义(0,0)
(define O1 (make-vect 1 0)) ;;;定义(1,0)
(define O2 (make-vect 1 1)) ;;;定义(1,1)
(define O3 (make-vect 0 1)) ;;;定义(0,1)
(define frame (make-frame O0 O1 O3))

;; 3.3 一个画对角线叉的画家
(define l5 (make-segment O0 O2))
(define l6 (make-segment O1 O3))
(define painter-x (segments->painter (list l5 l6)))

;; 3.4 wave
(define painter-wave 
  (segments->painter 
   (list (make-segment (make-vect 0.25 0.00) (make-vect 0.37 0.37)) ;1
         (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.25)) ;2
         (make-segment (make-vect 0.50 0.25) (make-vect 0.62 0.00)) ;3
         (make-segment (make-vect 0.75 0.00) (make-vect 0.70 0.50)) ;4
         (make-segment (make-vect 0.70 0.50) (make-vect 1.00 0.30)) ;5
         (make-segment (make-vect 1.00 0.50) (make-vect 0.75 0.62)) ;6
         (make-segment (make-vect 0.75 0.62) (make-vect 0.62 0.62)) ;7
         (make-segment (make-vect 0.62 0.62) (make-vect 0.75 0.75)) ;8
         (make-segment (make-vect 0.75 0.75) (make-vect 0.62 1.00)) ;9
         (make-segment (make-vect 0.40 1.00) (make-vect 0.30 0.75)) ;10
         (make-segment (make-vect 0.30 0.75) (make-vect 0.40 0.62)) ;11
         (make-segment (make-vect 0.40 0.62) (make-vect 0.25 0.62)) ;12
         (make-segment (make-vect 0.25 0.62) (make-vect 0.20 0.50)) ;13
         (make-segment (make-vect 0.20 0.50) (make-vect 0.00 0.70)) ;14
         (make-segment (make-vect 0.37 0.37) (make-vect 0.30 0.50)) ;15
         (make-segment (make-vect 0.30 0.50) (make-vect 0.12 0.37)) ;16
         (make-segment (make-vect 0.12 0.37) (make-vect 0.00 0.50)) ;17
         (make-segment (make-vect 0.50 0.70) (make-vect 0.35 0.75)) ;smile 1
         (make-segment (make-vect 0.50 0.70) (make-vect 0.65 0.75)) ;smile 2
         )))

;; 3.5 
(define (painter-people frame)
  ((segments->painter (list (make-segment (make-vect 0.165 0.945) (make-vect 0.465 0.665)) ; Left Leg
                           (make-segment (make-vect 0.465 0.665) (make-vect 0.465 0.285)) ; Body
                           (make-segment (make-vect 0.465 0.455) (make-vect 0.745 0.585)) ; Right arm
                           (make-segment (make-vect 0.465 0.665) (make-vect 0.755 0.925)) ;
                           (make-segment (make-vect 0.475 0.455) (make-vect 0.185 0.615)) ; ?
                           (make-segment (make-vect 0.245 0.265) (make-vect 0.685 0.295)) ; Head - Bot
                           (make-segment (make-vect 0.685 0.295) (make-vect 0.685 0.035)) ;
                           (make-segment (make-vect 0.685 0.035) (make-vect 0.245 0.065)) ;
                           (make-segment (make-vect 0.245 0.065) (make-vect 0.245 0.265)))) frame))
;; -------------------------------------------------------------------------

;; 4. 画家的变换与组合
;; 4.1 画家的变换与组合的common pattern
(define (transform-painter painter new-frame)
  (let ((origin (origin-frame new-frame)) ;;; 将new-frame的各个元素取出来
        (edge1 (edge1-frame new-frame))
        (edge2 (edge2-frame new-frame)))
    (lambda (frame) ;;; 定义一个返回过程, 参数为frame
      (let ((map-proc (frame-coord-map frame))) ;;; map-proc是对vect进行映射的过程, 接受一个向量. 
        (let ((new-origin (map-proc origin))
              (new-edge1 (map-proc edge1))
              (new-edge2 (map-proc edge2)))
         (painter (make-frame ;;; 将新的frame应用于painter
                   new-origin
                   (sub-vect new-edge1 new-origin)
                   (sub-vect new-edge2 new-origin)
                  )))))))

;; 4.2 flip-vert
(define (flip-vert painter)
  (transform-painter painter
                     (make-frame (make-vect 0.0 1.0) ;;; new origin
                                 (make-vect 1.0 1.0) ;;; new edge1
                                 (make-vect 0.0 0.0)))) ;;; new edge2

;; -------------------------------------------------------------------------

;; 5. 运行
;((flip-vert wave) frame)
;(define wave2 (beside wave (flip-vert wave)))
;(define wave4 (flipped-pairs wave))
;((flip-vert painter1) frame)
;((flip-horiz wave) frame)
;((rotate180 wave) frame)
;((squash-inwards wave4) frame)
;(wave4 frame)
;((right-split wave4 6) frame)
;((up-split wave4 6) frame)
;((squash-inwards (square-limit wave 6)) frame)
;((square-limit wave 6) frame)
;((square-limit (square-limit wave 2) 2) frame)
;((squash-inwards (square-limit (square-limit wave 2) 2)) frame)
;(wave2 frame)
;((right-split outline 6) frame)
;((squash-inwards (square-limit cross 4)) frame)
;((square-limit diamond 4) frame)
(painter-people frame)