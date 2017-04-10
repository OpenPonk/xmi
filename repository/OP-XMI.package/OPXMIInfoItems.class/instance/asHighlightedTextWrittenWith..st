GTInspector-Extensions
asHighlightedTextWrittenWith: aBlock
	| writer |
	writer := XMLHighlightingWriter new.
	aBlock value: writer.
	^ writer asHighlightedText