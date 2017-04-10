tests
testIsReferenceAttributeNotXmi
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'xmi:idref' value: 'value')).
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'xmi:id' value: 'value'))