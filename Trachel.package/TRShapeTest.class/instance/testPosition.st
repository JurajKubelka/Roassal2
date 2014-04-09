position
testPosition

	| box |
	box := TRBoxShape new.
	box translateTo: 10 @ 20.
	self assert: box position = (10 @ 20)