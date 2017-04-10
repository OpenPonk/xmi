tests
testIsReferenceElementIdRef
	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {#xmi:idref -> #value}))