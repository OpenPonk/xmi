tests
testReferenceAttribute
	| target reference attribute |
	target := self elementNamed: 'Target' attributes: {#xmi:id -> #target}.
	reference := self elementNamed: 'Reference' attributes: {#object -> #target}.
	visitor visitElement: reference.
	visitor visitElement: target.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result containedItems size equals: 1.
	attribute := result containedItem.
	self assert: attribute isReferenceAttribute.
	self assert: attribute referencedElements size equals: 1.
	self assert: attribute referencedElement equals: (visitor elementAt: target)