tests
testVisitObjectElementWithChild
	| node |
	node := (self elementNamed: 'parent')
		addNode: (self elementNamed: 'child');
		yourself.
	visitor visitElement: node.
	result := visitor elementAt: node.
	self assert: result xmiName equals: 'parent'.
	self assert: result containedItems size equals: 1.
	self assert: result containedItems first isElement.
	self assert: result containedItems first xmiName equals: 'child'