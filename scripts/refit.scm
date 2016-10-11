(define (refit image drawable)
	(gimp-image-undo-group-start image)
	(gimp-context-push)
 
 
	(plug-in-autocrop 1 image drawable)
	(gimp-image-scale image 500 500)
	(gimp-image-resize-to-layers image)
 
	(gimp-image-clean-all image)
	(gimp-context-pop)
	(gimp-image-undo-group-end image)
	(gimp-displays-flush)
	(list image)
)


(script-fu-register
	"refit"
	"<Image>/Tools/Refit"
	""
	"Matthew Morrone"
	"Uncopyright 2016 Matthew Morrone"
	"12 May 2016"
	"*"
	SF-IMAGE "Input Image" 0
	SF-DRAWABLE "Input Drawable" 0
)