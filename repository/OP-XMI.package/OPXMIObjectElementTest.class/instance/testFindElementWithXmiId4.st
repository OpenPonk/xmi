tests
testFindElementWithXmiId4
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'DDD'.
	self assert: result xmiName equals: 'ddd'