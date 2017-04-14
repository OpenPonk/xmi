tests
testElementNamed
	| el |
	(el := OPXMIObjectElement new)
		xmiName: 'container';
		containedItems: {OPXMIObjectElement new xmiName: 'element'}.
	self assert: (el elementNamed: 'element') xmiName equals: 'element'.
	self assert: (el elementNamed: 'none') equals: nil