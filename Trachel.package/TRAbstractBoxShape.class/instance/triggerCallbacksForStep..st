actions
triggerCallbacksForStep: aStep
	"aStep is a point that represents a translation step"
	callbacks ifNil: [ ^ self ].
	callbacks do: [ :c | c block value: self value: aStep ]