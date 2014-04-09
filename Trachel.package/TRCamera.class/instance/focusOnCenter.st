actions
focusOnCenter
	"Do nothing if no shape are present"
	canvas numberOfShapes = 0 ifTrue: [ ^ self ]. 
	self translateTo: self encompassingRectangle center