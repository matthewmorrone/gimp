

;(define (script-fu-guides-remove image)
;  (let* ((guide-id 0))
;    (gimp-image-undo-group-start image)

;    (set! guide-id (car (gimp-image-find-next-guide image 0)))
;    (while (> guide-id 0)
;      (gimp-image-delete-guide image guide-id)
;      (set! guide-id (car (gimp-image-find-next-guide image 0)))
;    )

;    (gimp-image-undo-group-end image)
;    (gimp-displays-flush)
;  )
;)
;(script-fu-register "script-fu-guides-remove"
;  _"_Remove all Guides"
;  _"Remove all horizontal and vertical guides"
;  "Alan Horkan"
;  "Alan Horkan, 2004. Public Domain."
;  "April 2004"
;  "*"
;  SF-IMAGE    "Image"    0
;)
;(script-fu-menu-register "script-fu-guides-remove"
;                         "<Image>/Image/Guides")






(define (script-fu-grid-guides image hgrid vgrid border)
  ;(script-fu-guides-remove image)
  (gimp-image-undo-group-start image)
  (let* (
        (width (car (gimp-image-width image)))
      	(height (car (gimp-image-height image)))
        (divH (/ width hgrid))
        (divV (/ height vgrid))
        (hcount 1)
        (vcount 1)
        )
        
    (if (= border TRUE)
      (begin
        (gimp-image-add-hguide image 0)
        (gimp-image-add-hguide image height)
        (gimp-image-add-vguide image 0)
        (gimp-image-add-vguide image width)
      )
    )

    (while (< hcount vgrid) 
      (gimp-image-add-hguide image (* divV hcount))
      (set! hcount (+ hcount 1))
    )

    (while (< vcount hgrid) 
      (gimp-image-add-vguide image (* divH vcount))
      (set! vcount (+ vcount 1))
    )

	(gimp-image-undo-group-end image)
  (gimp-displays-flush)
  )
)

(script-fu-register
  "script-fu-grid-guides"
  "<Image>/Image/Guides/Grid"
  "Add a grid of guides"
  "Luigi Chiesa"
  "Public Domain"
  "November 2008"
  "*"
  SF-IMAGE      "Image"   0
	SF-ADJUSTMENT	"Horizontal parts"	'(2 1 100 1 10 0 1)
	SF-ADJUSTMENT	"Vertical parts"	'(2 1 100 1 10 0 1)
  SF-TOGGLE "Border guides?" FALSE
)
