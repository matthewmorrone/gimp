
(define (BlackToAlpha image drawable)
	(gimp-image-undo-group-start image)
	(gimp-context-push)
 
	(plug-in-colortoalpha 1 image drawable '(0 0 0))
 
	(gimp-image-clean-all image)
	(gimp-context-pop)
	(gimp-image-undo-group-end image)
	(gimp-displays-flush)
	(list image drawable)
)
(script-fu-register
	"BlackToAlpha"
	"<Image>/Tools/BlackToAlpha"
	""
	"Matthew Morrone"
	"Uncopyright 2016 Matthew Morrone"
	"12 May 2016"
	"*"
	SF-IMAGE "Input Image" 0
	SF-DRAWABLE "Input Drawable" 0
)
; check for if already applied
; doesn't work if more than 2 main colors


