testing
includesPoint: aPoint
	^ (shape1 includesPoint: aPoint) or: [ shape2 includesPoint: aPoint ]