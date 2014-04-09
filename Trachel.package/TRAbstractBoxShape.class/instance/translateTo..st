actions
translateTo: aPoint
	| oldTopLeft |
	super translateTo: aPoint.
	oldTopLeft := rectangle topLeft.
	rectangle := (aPoint - (self extent / 2)) extent: self extent.
	self triggerCallbacksForStep: (rectangle topLeft - oldTopLeft)