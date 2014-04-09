public
stick: aShape below: anotherShape
	self move: aShape below: anotherShape. 
	anotherShape addCallback: 
		(TRTranslationCallback block: [ :shape :step | self move: aShape below: anotherShape ]) 
	
	