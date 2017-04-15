tests
testIsReferenceAttributeMulti
	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID1 ID2')).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'ID1'}).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'ID2'}).
	self
		assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID1 ID2'))