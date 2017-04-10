tests
testReferenceElement
	| target reference |
	target := self elementNamed: 'Target' attributes: {#xmi:id -> #target}.
	reference := self elementNamed: 'Reference' attributes: {#xmi:idref -> #target}.
	visitor visitElement: target.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result isReferenceElement.
	self assert: result referencedElements size equals: 1.
	self assert: result referencedElement equals: (visitor elementAt: target)