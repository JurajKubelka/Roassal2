testing
includesPoint: aPoint
	|apt|
	apt := AthensPolygonTester new.
	^ pathPoints inject: false into: [ :res :p |
		res or: ((apt polygon: p) includesPoint: aPoint)
	]