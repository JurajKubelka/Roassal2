public
stick: aShape above: anotherShape
	self move: aShape above: anotherShape. 
	anotherShape addCallback: 
		(TRTranslationCallback block: [ :shape :step | self move: aShape above: anotherShape ]) 
	
	