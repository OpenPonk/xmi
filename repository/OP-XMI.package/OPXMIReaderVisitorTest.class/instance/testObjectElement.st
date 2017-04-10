tests
testObjectElement
	result := visitor objectElementFor: (self elementNamed: 'el').
	self assert: result xmiName equals: 'el'