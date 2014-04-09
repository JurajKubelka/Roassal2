geometry
extent: anExtent
	| center |
	anExtent = self extent ifTrue: [ ^ self ].
	center := rectangle center.
	rectangle := (center - (anExtent / 2)) extent: anExtent.
	self resetPath