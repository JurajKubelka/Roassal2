public
from: aPoint to: anotherPoint color: aColor
	rectangle := aPoint corner: anotherPoint.
	self strokePaint: aColor.
	self color: aColor