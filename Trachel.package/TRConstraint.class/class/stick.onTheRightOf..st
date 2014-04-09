public
stick: aShape onTheRightOf: anotherShape
	self move: aShape onTheRightOf: anotherShape. 
	anotherShape addCallback: 
		(TRTranslationCallback block: [ :shape :step | self move: aShape onTheRightOf: anotherShape ]) 
	