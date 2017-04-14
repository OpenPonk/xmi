tests
testNameValue
	| element |
	element := OPXMIObjectElement new
		containedItems: {OPXMIValueElement xmiName: 'name' value: 'hello'}.
	self assert: element nameValue equals: 'hello'.
	self should: [ OPXMIObjectElement new nameValue ] raise: NotFound