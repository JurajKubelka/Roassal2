drawing
drawOn: athensCanvas
	"self drawEncompassingRectangleOn: athensCanvas color: (Color gray alpha: 0.1)."
	athensCanvas pathTransform restoreAfter: [
		"Draw the label centered on the position"
		athensCanvas pathTransform
			translateBy: position asIntegerPoint;
			translateBy: ((self width / -2) @ (self height / 2)) asIntegerPoint;
			translateBy: (0 @ self descent negated) asIntegerPoint.
			"scaleBy: (fontSize / 10)."
		athensCanvas setFont: font.
		athensCanvas setPaint: color.
		athensCanvas drawString: text
		]