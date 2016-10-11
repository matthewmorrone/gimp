(define (script-fu-save-all-images) 
	(let* ((i (car (gimp-image-list))) 
	(image)) 
	(while (> i 0) 
		(set! image (vector-ref (cadr (gimp-image-list)) (- i 1))) 
		(gimp-file-save RUN-NONINTERACTIVE 
			image 
			(car (gimp-image-get-active-layer image)) 
			(car (gimp-image-get-filename image)) 
		(car (gimp-image-get-filename image))) 
		(gimp-image-clean-all image) 
	(set! i (- i 1))))) 

(script-fu-register "script-fu-save-all-images" 
	"<Image>/File/Save All" 
	"Save all opened images" 
	"Saul Goode" 
	"Saul Goode" 
	"11/21/2006" 
	"" 
) 



(define (script-fu-save-image image) 
	(gimp-file-save RUN-NONINTERACTIVE image 
		(car (gimp-image-get-active-layer image))
		(car (gimp-image-get-filename image))
	(car (gimp-image-get-filename image)))
	(gimp-image-clean-all image)
)

(script-fu-register "script-fu-save-image" 
	"<Image>/File/Save One" 
	"Save one opened image" 
	"Saul Goode" 
	"Saul Goode" 
	"11/21/2006" 
	"*"
	SF-IMAGE "Input Image" 0
) 
