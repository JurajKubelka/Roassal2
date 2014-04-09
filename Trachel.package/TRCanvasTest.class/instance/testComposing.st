composing
testComposing

	| s1 s2 c trCanvas |
	s1 := TRBoxShape new.
	s2 := TRBoxShape new.
	c := TRCompositeShape with: s1 with: s2.
	trCanvas := TRCanvas new.
	trCanvas addShape: c.
	self assert: trCanvas numberOfShapes = 2.
	
	c remove.
	self assert: trCanvas numberOfShapes = 0.