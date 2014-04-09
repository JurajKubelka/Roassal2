drawing
drawOn: athensCanvas

	athensCanvas pathTransform restoreAfter: [
		
		athensCanvas setShape: self path.
		(athensCanvas setStrokePaint: strokePaint) width: width.
		athensCanvas draw  ]