tests
testIsReferenceElementHref
	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {#href -> #content}))