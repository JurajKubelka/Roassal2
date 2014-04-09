drawing
drawOn: athensCanvas

	athensCanvas pathTransform restoreAfter: [
		athensCanvas
			setPaint: color;
			drawShape: self path.
			
		athensCanvas
			setStrokePaint: strokePaint;
			drawShape: self path  ]