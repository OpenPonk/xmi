tests
testFindElementWithXmiId3
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'CCC'.
	self assert: result xmiName equals: 'ccc'