convertion
fromSpaceToPixel: aPoint
	| tr |
	tr := (canvas extent / 2) - self position.
	^ AthensAffineTransform new translation: tr*(self scale); scaleBy: (self scale) asFloat;  transform: aPoint
	"^ AthensAffineTransform new translation: tr; transform: aPoint"