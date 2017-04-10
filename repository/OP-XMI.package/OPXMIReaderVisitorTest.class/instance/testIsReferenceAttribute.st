tests
testIsReferenceAttribute
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'value')).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'value'}).
	self assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'value'))