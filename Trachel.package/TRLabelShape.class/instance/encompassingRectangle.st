accessing
encompassingRectangle
	| w h |
	w := self width.
	h := self height.
	^ position + ((w / -2) @ (h / -2)) extent: (w @ h)