tests
testFindElementWithXmiId2
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'BBB'.
	self assert: result xmiName equals: 'bbb'