hooks
computePath
	canvas ifNil: [ ^ self ].
	path := self athensCanvas
				createPath: [ :builder | 
					builder
						absolute;
						moveTo: 0 @ 1;
						ccwArcTo: 1.0 @ 0.0 angle: 90 degreesToRadians;
						ccwArcTo: 0.0 @ -1.0 angle: 90 degreesToRadians;
						ccwArcTo: -1.0 @ 0.0 angle: 90 degreesToRadians;
						ccwArcTo: 0 @ 1.0 angle: 90 degreesToRadians ]
"	path := canvas
		cacheAt: self
		ifAbsentPut: [ 
			canvas
				createPath: [ :builder | 
					builder
						absolute;
						moveTo: 0 @ 1;
						ccwArcTo: 1.0 @ 0.0 angle: 90 degreesToRadians;
						ccwArcTo: 0.0 @ -1.0 angle: 90 degreesToRadians;
						ccwArcTo: -1.0 @ 0.0 angle: 90 degreesToRadians;
						ccwArcTo: 0 @ 1.0 angle: 90 degreesToRadians ] ]"