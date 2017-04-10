accessing
referencedElement
	^ referencedElements ifEmpty: [ nil ] ifNotEmpty: [ referencedElements first ]