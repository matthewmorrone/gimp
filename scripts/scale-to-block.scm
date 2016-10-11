(define (scale-to-block image drawable size)
	(let*
		(
			(width (car (gimp-image-width image)))
			(height (car (gimp-image-height image)))
		)
		(if (> width height)
			(gimp-image-scale image size (* height (/ size width)))
			(gimp-image-scale image (* width (/ size height)) size)
		)
	)
	(gimp-image-resize image size size
		(/ (- size (car (gimp-image-width image))) 2)
		(/ (- size (car (gimp-image-height image))) 2)
	)
	(gimp-context-set-background '( 0 0 0))
	(gimp-image-flatten image)
) 
(script-fu-register "scale-to-block"
	"<Image>/Tools/Scale To Block"
	"Scales an image to a given size then makes the canvas a square with the image centered"
	"Chris Kent" 
	"WireBear.com" 
	"November 2009"
	"RGB* GRAY*" 
	SF-IMAGE "Image" 0
	SF-DRAWABLE "Drawable" 0
	SF-VALUE "Block Size" "32"
) 