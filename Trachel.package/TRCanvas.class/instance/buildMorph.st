instance creation
buildMorph
	morph := TRMorph new
		canvas: self;
		extent: canvas extent.
	^ morph