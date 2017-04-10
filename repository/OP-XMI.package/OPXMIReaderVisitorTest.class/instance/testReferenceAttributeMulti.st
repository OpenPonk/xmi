tests
testReferenceAttributeMulti
	| target1 target2 reference attribute |
	target1 := self elementNamed: 'Target' attributes: {#xmi:id -> #target1}.
	target2 := self elementNamed: 'Target' attributes: {#xmi:id -> #target2}.
	reference := self elementNamed: 'Reference' attributes: {#object -> 'target1 target2'}.
	visitor visitElement: reference.
	visitor visitElement: target1.
	visitor visitElement: target2.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result containedItems size equals: 1.
	attribute := result containedItem.
	self assert: attribute isReferenceAttribute.
	self assert: attribute referencedElements size equals: 2.
	self assert: attribute referencedElements first equals: (visitor elementAt: target1).
	self assert: attribute referencedElements second equals: (visitor elementAt: target2)