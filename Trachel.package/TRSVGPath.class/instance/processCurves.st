as yet unclassified
processCurves
	paths := self separateSubPaths: curves.
	pathPoints := OrderedCollection new.
	paths do: [ :p |
		|pts|
		pts := OrderedCollection new.
		p do: [ :curve |
			curve key = 'm' ifFalse: [pts add: (curve value at: 1) * scale]
		].
		pathPoints add: pts.
	].
	points := pathPoints inject: #() into: [ :acc :next | acc, next ].
	position := self encompassingRectangle center.