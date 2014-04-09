event-processed
rtMouseDragBegin: evt
	| relativePosition |
	eventBeginingDragging := evt copy.
	
	relativePosition := self relativePositionFor: evt.
	shapeBeingPointed := self shapeWithActionForPositionInPixels: relativePosition