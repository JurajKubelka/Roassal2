composite
testExtendingAComposite

	| c s1 s2 cs |
	c := TRCanvas new.
	s1 := TRBoxShape new size: 50.
	s2 := TRBoxShape new size: 40.
	cs := TRCompositeShape with: s1 with: s2.
	c addShape: cs.
	cs extent: 100 @ 80.
	
	self assert: s1 extent = (100 @ 80).
	self assert: s2 extent = (100 @ 80).