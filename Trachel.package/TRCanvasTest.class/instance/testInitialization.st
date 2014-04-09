tests
testInitialization

	| circle |
	circle := TREllipseShape new.
	self assert: circle rectangle = TRAbstractBoxShape nullRectangle