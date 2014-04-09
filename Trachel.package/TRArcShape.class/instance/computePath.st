hooks
computePath
	| i e aAngle bAngle |
	canvas ifNil: [ ^ self ].
	aAngle:=alphaAngle value degreesToRadians.
	bAngle:=betaAngle value degreesToRadians.
	i := innerRadius value.
	e := externalRadius value.
	path := 
self athensCanvas
	createPath: [ :builder | 
		builder
			absolute;
			moveTo: ((i * (aAngle cos)) @ (i * (aAngle sin)));
			arcTo: ((i * (bAngle cos)) @ (i * (bAngle sin))) angle: bAngle - aAngle cw: true;
			ccwArcTo: ((e * (bAngle cos)) @ (e * (bAngle  sin))) angle: 0;
			ccwArcTo: ((e * (aAngle  cos)) @ (e * (aAngle  sin))) angle: bAngle  - aAngle  ;
			ccwArcTo: ((i * (aAngle  cos)) @ (i * (aAngle  sin))) angle: 0 ]