convertion
fromPixelToSpace: aPoint
	| tr |
	tr := ((canvas extent / 2) - self position) negated.
	^ AthensAffineTransform new scaleBy: (1 / self scale) asFloat; translation: tr*(1 / self scale); transform: aPoint