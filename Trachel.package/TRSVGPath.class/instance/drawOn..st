drawing
drawOn: aCanvas
	| pt |
	pt := aCanvas pathTransform.
	pt restoreAfter: [
		pt scaleBy: scale.
		aCanvas setShape: self path.
		fillColor isNotNil ifTrue: [ aCanvas setPaint: fillColor; draw ].
		(aCanvas setStrokePaint: strokePaint) width: borderWidth.
		aCanvas draw
	]