tests
testObjectElement
	result := visitor objectElementFor: (self elementNamed: 'el').
	self assert: result isObjectElement.
	self assert: result xmiName equals: 'el'