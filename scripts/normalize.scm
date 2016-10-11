(define (normalize image)
	(gimp-image-undo-group-start image)
	(gimp-context-push)
	(gimp-image-convert-rgb image)
	(gimp-image-convert-indexed image 0 3 2 FALSE TRUE "")
	(gimp-image-clean-all image)
	(gimp-context-pop)
	(gimp-image-undo-group-end image)
	(gimp-displays-flush)
	(list image)
)


(script-fu-register
	"normalize"
	"<Image>/Tools/Normalize"
	""
	"Matthew Morrone"
	"Uncopyright 2016 Matthew Morrone"
	"12 May 2016"
	"*"
	SF-IMAGE "Input Image" 0
)