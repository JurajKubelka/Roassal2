conversion
testConversion
	self assert: (camera fromSpaceToPixel: 0 @ 0) = (canvas extent / 2).
	self assert: (camera fromSpaceToPixel: 10 @ 10) = ((canvas extent / 2) + (10 @ 10)).

	self assert: (camera fromPixelToSpace: (canvas extent / 2)) = (0 @ 0).
	self assert: (camera fromPixelToSpace: ((canvas extent / 2) + (10 @ 10))) = (10 @ 10)