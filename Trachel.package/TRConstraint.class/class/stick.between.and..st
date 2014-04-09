public
stick: aShape between: s1 and: s2
	| callback |
	self move: aShape between: s1 and: s2.
	
	callback := TRTranslationCallback block: [ :shape :step | self move: aShape between: s1 and: s2 ].
	s1 addCallback: callback.
	s2 addCallback: callback