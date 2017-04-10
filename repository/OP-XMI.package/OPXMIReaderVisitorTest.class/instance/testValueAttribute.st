tests
testValueAttribute
	result := visitor valueAttributeFor: (XMLAttribute name: 'name' value: 'value').
	self assert: result xmiName equals: 'name'.
	self assert: result value equals: 'value'