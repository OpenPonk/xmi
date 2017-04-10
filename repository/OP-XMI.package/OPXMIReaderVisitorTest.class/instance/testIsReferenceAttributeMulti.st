tests
testIsReferenceAttributeMulti
	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'value1 value2')).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'value1'}).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'value2'}).
	self
		assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'value1 value2'))