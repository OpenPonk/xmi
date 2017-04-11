tests
testFindElementWithXmiId5
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'EEE'.
	self assert: result equals: nil