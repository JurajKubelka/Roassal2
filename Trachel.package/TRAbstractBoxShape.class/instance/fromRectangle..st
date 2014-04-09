public
fromRectangle: r
	| oldTopLeft |
	oldTopLeft := rectangle topLeft.
	rectangle := r.
	position := rectangle center.
	self triggerCallbacksForStep: (r topLeft - oldTopLeft).
	self resetPath