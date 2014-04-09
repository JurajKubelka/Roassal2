actions
translateBy: aPoint
	super translateBy: aPoint.
	rectangle := (rectangle topLeft + aPoint) extent: rectangle extent.
	self triggerCallbacksForStep: aPoint