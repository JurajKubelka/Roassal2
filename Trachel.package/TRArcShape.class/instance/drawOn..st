drawing
drawOn: athensCanvas
	self shouldBeDrawn ifFalse: [ ^ self ].
	athensCanvas pathTransform restoreAfter: [
		athensCanvas
			setPaint: color;
			drawShape: self path.

		self drawStrokeIfNecessaryOn: athensCanvas
		]