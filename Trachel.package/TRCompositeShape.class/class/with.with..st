public
with: s1 with: s2
	|max|
	max := s1 encompassingRectangle extent max: s2 encompassingRectangle extent.
	s1 extent: max.
	s2 extent: max.
	^ self new shape1: s1; shape2: s2; yourself