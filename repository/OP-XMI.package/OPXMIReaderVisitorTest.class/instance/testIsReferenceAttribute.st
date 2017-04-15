tests
testIsReferenceAttribute
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID')).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'ID'}).
	self assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID'))