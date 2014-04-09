accessing
shapeWithActionForPositionInPixels: position
	"position is in pixel, it corresponds to the physical location in the window.
	e.g., 0 @ 0 is top left of the window"
	fixedShapes reverseDo: [ :s | 
		((s includesPoint: position) and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].

	shapes reverseDo: [ :s | 
		((s includesPoint: (self camera fromPixelToSpace: position)) 
			and: [ s hasEventCallback ]) ifTrue: [ ^ s ] ].
	^ self