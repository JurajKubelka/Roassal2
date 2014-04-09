testing
includesPoint: aPoint
	| pDistanceOrigin pointAngle inside aAngle bAngle |
	(alphaAngle value = betaAngle value) ifTrue: [ ^ false ].
	inside:=true.
	(alphaAngle value % 360 = 0 ) 
		ifFalse: [ aAngle := alphaAngle value \\  360 ]
		ifTrue: [ aAngle := alphaAngle value ].
	(betaAngle value % 360 = 0 )
		ifFalse: [ bAngle := betaAngle value \\  360 ]
		ifTrue: [ bAngle := betaAngle value ].
	pointAngle:= ((aPoint x @ aPoint y negated) angleWith: self center) radiansToDegrees \\  360.
	pDistanceOrigin := (aPoint squaredDistanceTo: self center) sqrt.
	((pDistanceOrigin < innerRadius value) or: (pDistanceOrigin > externalRadius value))
		ifTrue: [ ^ false ].
	(pointAngle % 360 = 0 )
		ifTrue:[
			(aAngle % 360 = 0) ifTrue: [^ true ].
			(bAngle % 360 = 0) ifTrue: [ ^ true ] ].
	(aAngle < bAngle)
	ifTrue:[
		(pointAngle >= aAngle) ifTrue:[ inside:=inside not ].
		(pointAngle <= bAngle) ifTrue:[ inside:=inside not ] ]
	ifFalse:[
		(bAngle = 0) ifTrue:[bAngle:=360].
		(pointAngle <= aAngle) ifTrue:[ inside:=inside not ].
		(pointAngle <= bAngle) ifTrue:[ inside:=inside not ] ].
	^ inside