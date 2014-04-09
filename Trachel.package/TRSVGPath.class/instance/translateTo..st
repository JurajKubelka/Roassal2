actions
translateTo: aPoint
	| disp |
	disp := (aPoint - position) / scale.
	super translateTo: aPoint.
	self updateCurves: (self curves collect: [ :c |
		c key -> (c value collect: [ :p | p + disp ])]).
	rectangle := rectangle translateBy: disp.