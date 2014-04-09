actions
removeCallback: aCallback ifAbsent: anErrorBlock
	callbacks ifNil: [ ^ self ].
	callbacks remove: aCallback ifAbsent: anErrorBlock