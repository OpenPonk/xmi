tests
testFindElementWithXmiId1
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'AAA'.
	self assert: result equals: root