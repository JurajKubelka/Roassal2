initialization
initialize
	super initialize.
	scale := 1.
	paths := #().
	pathPoints := #().
	points := #().
	rotationAngle := 0.
	borderWidth := 0.
	fillColor := Color black.
	rectangle := Rectangle origin: 0@0 corner: 0@0.