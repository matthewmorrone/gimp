(define (clarifyrgb image drawable)
	(gimp-image-undo-group-start image)
	(gimp-context-push)
	(gimp-palette-set-foreground '(255 255 255))
	(gimp-palette-set-background '(0 0 0))
	(gimp-image-convert-indexed image 0 0 2 FALSE TRUE "")
	(gimp-image-convert-rgb image)
	(gimp-by-color-select drawable '(255 255 255) 25 2 TRUE FALSE 0 TRUE)
	(gimp-edit-clear drawable)
	(gimp-selection-invert image)
	(gimp-edit-fill drawable 2)
	(gimp-selection-clear image)
	(gimp-image-convert-indexed image 0 3 2 FALSE TRUE "")
	(gimp-image-clean-all image)
	(gimp-context-pop)
	(gimp-image-undo-group-end image)
	(gimp-displays-flush)
	(list image drawable)
)
(script-fu-register
	"clarifyrgb"
	"<Image>/Tools/Clarify RGB"
	""
	"Matthew Morrone"
	"Uncopyright 2016 Matthew Morrone"
	"12 May 2016"
	"RGB*"
	SF-IMAGE "Input Image" 0
	SF-DRAWABLE "Input Drawable" 0
)
; check for if already applied
; doesn't work if more than 2 main colors

