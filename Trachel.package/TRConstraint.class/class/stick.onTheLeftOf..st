public
stick: aShape onTheLeftOf: anotherShape
	self move: aShape onTheLeftOf: anotherShape. 
	anotherShape addCallback: 
		(TRTranslationCallback block: [ :shape :step | self move: aShape onTheLeftOf: anotherShape ]) 
	