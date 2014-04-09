event-processed
rtMouseMoving: evt

	| relativePosition ev shape |
	relativePosition := self relativePositionFor: evt.	
	shape := self shapeWithActionForPositionInPixels: relativePosition.

	ev := TRMouseMove new.
	ev position: relativePosition.
	ev shape: shape.
	ev morph: self.
	ev canvas: trachelCanvas.
	shape announce: ev