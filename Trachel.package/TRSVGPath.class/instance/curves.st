accessing
curves
	curves isNil ifFalse: [ ^ curves ].
	curves := self processPath.
	self processCurves.
	^ curves