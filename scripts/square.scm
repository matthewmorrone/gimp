


(define (square image drawable)
    (gimp-image-undo-group-start image)
    (gimp-context-push)
    (plug-in-autocrop 1 image drawable)
    (let* (
        (width (car (gimp-image-width image)))
        (height (car (gimp-image-height image)))
        (newWidth width)
        (newHeight height)
        (layer (vector-ref (cadr (gimp-image-get-layers image)) 0))
    )

        (if (< width height)
            (set! newWidth height)
        )
        (if (> width height)
            (set! newHeight width)
        )

        (gimp-image-resize image newWidth newHeight (/ (- newWidth width) 2) (/ (- newHeight height) 2))
        (gimp-layer-resize-to-image-size layer)
        
        (if (and (> newWidth 500) (> newHeight 500))
            (gimp-image-scale image 500 500) 
        )

        ;(gimp-image-resize-to-layers image)

        (gimp-image-clean-all image)
        (gimp-context-pop)
        (gimp-image-undo-group-end image)
        (gimp-displays-flush)
    
        (list newWidth newHeight)
    )
)
(script-fu-register
    "square"
    "<Image>/Tools/Square"
    ""
    "Matthew Morrone"
    "Uncopyright 2016 Matthew Morrone"
    "12 May 2016"
    "*"
    SF-IMAGE "Input Image" 0
    SF-DRAWABLE "Input Drawable" 0
)
