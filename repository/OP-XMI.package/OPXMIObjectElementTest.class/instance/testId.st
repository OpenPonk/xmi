tests
testId
	| element |
	element := OPXMIObjectElement new.
	self assert: element xmiId equals: nil.
	element
		containedItems:
			{OPXMIValueAttribute new
				xmiName: #xmi:id;
				value: 'ID'}.
	self assert: element xmiId equals: 'ID'