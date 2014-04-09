actions
rotateBy: anAngle
	|center|
	center := self center / scale.
	
	self updateCurves: (self curves collect: [ :c |
		c key -> (c value collect: [ :p |
			| pp cosTheta sinTheta |
			pp := p - center.
			cosTheta := anAngle cos.
			sinTheta := anAngle sin.
			(pp x * cosTheta - (pp y * sinTheta)) @ (pp x * sinTheta + (pp y * cosTheta))
			+ center.
		])]).
	
	rotationAngle := rotationAngle + anAngle.
	^ rotationAngle.