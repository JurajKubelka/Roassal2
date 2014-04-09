testing
hasEventCallback
	^ announcer notNil and: [ announcer numberOfSubscriptions > 0 ]