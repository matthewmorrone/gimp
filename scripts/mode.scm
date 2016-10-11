(define (mode i)
	(case (gimp-image-base-type i)
		(0 'RGB)
		(1 'GRAY)
		(2 'INDEXED)
	)
)

(define (getDrawableFromImage i)
	(gimp-image-get-active-drawable i)
)
(define (getImageFromDrawable d)
	(gimp-item-get-image d)
)



; (script-fu-register
; 	"normalize"
; 	"<Image>/Tools/Normalize"
; 	""
; 	"Matthew Morrone"
; 	"Uncopyright 2016 Matthew Morrone"
; 	"12 May 2016"
; 	""
; 	SF-IMAGE "Input Image" 0
; 	SF-DRAWABLE "Input Drawable" 0
; )



(script-fu-register
	"mode"
	"<Image>/Tools/Mode"
	""
	"Matthew Morrone"
	"Uncopyright 2016 Matthew Morrone"
	"12 May 2016"
	"*"
	SF-IMAGE "Input Image" 0
)