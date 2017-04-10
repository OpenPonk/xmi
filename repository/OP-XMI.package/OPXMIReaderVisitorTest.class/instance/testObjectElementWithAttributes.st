tests
testObjectElementWithAttributes
	result := visitor
		objectElementFor: (self elementNamed: 'el' attributes: {#name -> #value}).
	self assert: result xmiName equals: 'el'.
	self assert: result containedItems size equals: 1.
	self assert: result containedItems first isValueAttribute.
	self assert: result containedItems first xmiName equals: 'name'.
	self assert: result containedItems first value equals: 'value'