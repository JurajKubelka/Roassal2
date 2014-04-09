drawing
drawStrokeIfNecessaryOn: athensCanvas
	| scale |
	scale := self canvas camera scale.
	^ strokePaint
		ifNotNil: [ 
			(athensCanvas setStrokePaint: strokePaint) width: (self strokeWidth / (scale )) asFloat.
			athensCanvas drawShape: path ]