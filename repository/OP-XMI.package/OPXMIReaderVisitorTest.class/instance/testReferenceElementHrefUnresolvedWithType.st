tests
testReferenceElementHrefUnresolvedWithType
	| reference |
	reference := self
		elementNamed: 'type'
		attributes:
			{#xmi:type -> 'uml:PrimitiveType'.
			#href -> 'PrimitiveTypes.xmi#String'}.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result isReferenceElement.
	self assert: result href equals: 'PrimitiveTypes.xmi#String'.
	self assert: result referencedElements size equals: 0