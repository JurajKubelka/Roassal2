util
moveAtTheBottomOfTheWindow: trachelShape

	| windowSize |
	windowSize := trachelShape canvas extent.
	trachelShape translateTo: ((trachelShape width / 2) @ (windowSize y - (trachelShape height / 2)))