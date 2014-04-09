accessing
path
	path ifNil: [ self computePath ].
	^ path