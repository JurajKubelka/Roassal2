drawing
"protocol: drawing"
drawOn: aCanvas
	"aCanvas is a FormCanvas"
	| offset |
	
"	self checkSession."
	
	aCanvas fillRectangle: bounds color: trachelCanvas color.
	trachelCanvas playAnimations.
	
	"The drawing has to be done when a change in the shapes occured or when there is an animation."
	surface drawDuring: [:cs |
		surface clear.
		
		"We display the elements that are subject to the camera"
		offset := (self extent / 2) - trachelCanvas camera position.
		cs pathTransform translateX: offset x Y: offset y.
		cs pathTransform 
			scaleBy: trachelCanvas camera scale.
		trachelCanvas shapes do: [ :trachelShape |
			trachelShape drawOn: cs.
		].
	
		"We display the elements that are _NOT_ subject to the camera"
		cs pathTransform loadIdentity.
		trachelCanvas fixedShapes do: [ :trachelShape |
			trachelShape drawOn: cs.
		].
	].
	"aCanvas translucentImage: surface asForm at: self bounds origin."
	"asForm creates a new Form, which is likely to be expensive. This can be cached"
	aCanvas image: surface asForm at: self bounds origin sourceRect: (0 @ 0 extent: surface extent) rule: 34