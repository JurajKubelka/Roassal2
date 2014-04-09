hooks
separateSubPaths: someCurves
	| subPath |
	paths := OrderedCollection new.
	subPath := OrderedCollection new.
	
	someCurves do: [ :c |
		c key = 'm' ifTrue: [ paths add: subPath. subPath:= OrderedCollection new ].
		subPath add: c.
	].
	paths add: subPath.
	^ paths