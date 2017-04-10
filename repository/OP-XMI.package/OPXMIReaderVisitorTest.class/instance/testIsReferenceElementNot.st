tests
testIsReferenceElementNot
	self
		deny: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {#other -> #sth}))