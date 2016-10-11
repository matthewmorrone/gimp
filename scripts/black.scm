


(define (black-background image drawable)
	(gimp-image-undo-group-start image)
	(gimp-context-push)
	(let* (
		(width (car (gimp-image-width image)))
		(height (car (gimp-image-height image)))
		(newLayer
		          (car
		              (gimp-layer-new
		                image
		                width
		                height
		                RGB-IMAGE
		                "background"
		                100
		                NORMAL
		              )
		          )
		)
	)
   
   
	;(gimp-image-flatten image)

	(gimp-image-add-layer image newLayer 1)
	(gimp-context-set-background '(0 0 0))
	(gimp-context-set-foreground '(255 255 255))
	(gimp-drawable-fill newLayer BACKGROUND-FILL)
   
	(gimp-image-clean-all image)
	(gimp-context-pop)
	(gimp-image-undo-group-end image)
	(gimp-displays-flush)
	(list image drawable)
	)
)
(script-fu-register
	"black-background"
	"<Image>/Tools/Add Black Background"
	""
	"Matthew Morrone"
	"Uncopyright 2016 Matthew Morrone"
	"12 May 2016"
	"RGB*"
	SF-IMAGE "Input Image" 0
	SF-DRAWABLE "Input Drawable" 0
)
