public
stick: aShape onTheCenterOf: anotherShape
	self move: aShape onTheCenterOf: anotherShape. 
	anotherShape addCallback: 
		(TRTranslationCallback block: [ :shape :step | self move: aShape onTheCenterOf: anotherShape ]) 
	