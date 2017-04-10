tests
testReferenceElementHrefUnresolved
	| reference |
	reference := self
		elementNamed: 'importedPackage'
		attributes: {#href -> 'http://www.omg.org/spec/DD/20131001/DI.xmi#_0'}.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result isReferenceElement.
	self assert: result href equals: 'http://www.omg.org/spec/DD/20131001/DI.xmi#_0'.
	self assert: result referencedElements size equals: 0