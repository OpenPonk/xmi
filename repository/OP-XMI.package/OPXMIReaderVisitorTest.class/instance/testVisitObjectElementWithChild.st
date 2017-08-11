tests
testVisitObjectElementWithChild
	| node |
	node := (self elementNamed: 'parent' attributes: {#xmi:type -> 'type'})
		addNode: (self elementNamed: 'child');
		yourself.
	visitor visitElement: node.
	result := visitor elementAt: node.
	self assert: result xmiName equals: 'parent'.
	self assert: result containedItems size equals: 2.
	self assert: result containedItems second isElement.
	self assert: result containedItems second xmiName equals: 'child'