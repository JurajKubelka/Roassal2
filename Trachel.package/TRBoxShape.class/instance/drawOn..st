drawing
drawOn: athensCanvas
	self shouldBeDrawn
		ifFalse: [ ^ self ].
	athensCanvas pathTransform
		restoreAfter: [ 
			"athensCanvas pathTransform
				translateBy: rectangle center;
				scaleBy: rectangle extent / 2."
			athensCanvas
				setPaint: color;
				drawShape: self path.
			self drawStrokeIfNecessaryOn: athensCanvas ]