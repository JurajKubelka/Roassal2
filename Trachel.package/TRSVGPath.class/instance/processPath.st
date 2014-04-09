as yet unclassified
processPath
	"This method parse the path"
	"
	A complete description may be found on http://www.w3.org/TR/SVG/paths.html#PathData
	So far, we only consider the following SVG tokens:
	
	M = Move to - absolute
	m = Move to - relative
	
	Z or z = Close path
	
	L = Line to - absolute
	l = Line to - relative
	
	The description of SVG path, says that M and m may accept more than one coordinates. In practices, this is rarely the case. 	
	"
	| p initialPoint answer tokens stream token t pathWithSpaceBeforeMinus cp1 cp2 nextPoint|
	p := 0 @ 0.
	initialPoint := nil.
	answer := OrderedCollection new.
	
	pathWithSpaceBeforeMinus := pathStr copyReplaceAll: '-' with: ' -' asTokens: false.
	tokens := pathWithSpaceBeforeMinus findTokens: 'MmLlZzCcSsQqTtHhVv, ' keep: 'MmLlZzCcSsQqTtHhVv'.
	stream := ReadStream on: tokens.
	nextPoint := [ (Float readFrom: stream next) @ (Float readFrom: stream next) ].
	
	[ stream atEnd ] whileFalse: [ 
		token := stream next.
		token = 'M' ifTrue: [ p := nextPoint value. answer add: #m -> {p}. initialPoint := nil. cp1 := nil. cp2 := nil ].
		token = 'm' ifTrue: [ p := p + (nextPoint value). answer add: #m -> {p}. initialPoint := nil. cp1 := nil. cp2 := nil ].

		(token = 'Z' or: [ token = 'z' ]) ifTrue: [ answer add: #l -> {initialPoint}. initialPoint := nil ].

		token = 'L' ifTrue: [ t := nextPoint value. answer add: #l -> {t}. p := t. cp1 := nil. cp2 := nil ].
		token = 'l' ifTrue: [ t := p + (nextPoint value). answer add: #l -> {t}. p := t. cp1 := nil. cp2 := nil ].
		
		token = 'V' ifTrue: [ t := (p x) @ (Float readFrom: stream next). answer add: #l -> {t}. p := t. cp1 := nil. cp2 := nil ].
		token = 'v' ifTrue: [ t := p + (0 @ (Float readFrom: stream next)). answer add: #l -> {t}. p := t. cp1 := nil. cp2 := nil ].
		
		token = 'H' ifTrue: [ t := (Float readFrom: stream next) @ (p y). answer add: #l -> {t}. p := t. cp1 := nil. cp2 := nil ].
		token = 'h' ifTrue: [ t := p + ((Float readFrom: stream next) @ 0). answer add: #l -> {t}. p := t. cp1 := nil. cp2 := nil ].
		
		token = 'C' ifTrue: [
			cp1 := nextPoint value. cp2 := nextPoint value.
			t := nextPoint value.
			answer add: #c -> {t. cp1. cp2}. p := t. cp1 := nil ].
		token = 'c' ifTrue: [ 
			cp1 := p + (nextPoint value). cp2 := p + (nextPoint value).
			t := p + (nextPoint value).
			answer add: #c -> {t. cp1. cp2}. p := t. cp1 := nil ].
		
		token = 'S' ifTrue: [ 
			cp1 := (cp2 isNil ifTrue: [ p ] ifFalse: [ p + (p - cp2) ]). cp2 := nextPoint value.
			t := nextPoint value.
			answer add: #c -> { t. cp1. cp2. }. p:= t. cp1 := nil ].
		token = 's' ifTrue: [ 
			cp1 := (cp2 isNil ifTrue: [ p ] ifFalse: [ p + (p - cp2) ]). cp2 := p + nextPoint value.
			t := p + nextPoint value.
			answer add: #c -> { t. cp1. cp2. }. p:= t. cp1 := nil ].
		
		token = 'Q' ifTrue: [
			cp1 := nextPoint value. t := nextPoint value.
			answer add: #q -> {t. cp1}. p := t. cp2 := nil ].
		token = 'q' ifTrue: [ 
			cp1 := p + (nextPoint value). t := p + (nextPoint value).
			answer add: #q -> {t. cp1}. p := t. cp2 := nil ].
		
		token = 'T' ifTrue: [
			cp1 := (cp1 isNil ifTrue: [ p ] ifFalse: [ p + (p - cp1) ]). t := nextPoint value.
			answer add: #q -> {t. cp1}. p := t. cp2 := nil ].
		token = 't' ifTrue: [ 
			cp1 := (cp1 isNil ifTrue: [ p ] ifFalse: [ p + (p - cp1) ]). t := p + (nextPoint value).
			answer add: #q -> {t. cp1}. p := t. cp2 := nil ].
		
		initialPoint ifNil: [ initialPoint := p ].
 	].
	^ answer asArray