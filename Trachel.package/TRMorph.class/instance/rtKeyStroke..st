event-processed
rtKeyStroke: evt
	| relativePosition ev  shape |
	
	(evt commandKeyPressed and: [ evt keyCharacter = $w ]) ifTrue: [ self owner delete ].
	relativePosition := self relativePositionFor: evt.
	
	ev := TRKeyDown new keyValue: evt keyValue.
	shape := self shapeWithActionForPositionInPixels: relativePosition.

	ev shape: shape.
	ev morph: self.
	ev canvas: trachelCanvas.
	ev position: (trachelCanvas camera fromPixelToSpace: relativePosition).

	shape announce: ev.
