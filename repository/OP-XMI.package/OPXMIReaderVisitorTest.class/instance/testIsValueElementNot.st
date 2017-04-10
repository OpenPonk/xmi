tests
testIsValueElementNot
	self deny: (visitor isValueElement: (XMLElement name: 'el' attributes: {#key -> #value}))