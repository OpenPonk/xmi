tests
testType
	| element |
	element := OPXMIObjectElement new.
	self assert: element xmiType equals: nil.
	element
		containedItems:
			{OPXMIValueAttribute new
				xmiName: #xmi:type;
				value: 'TYPE'}.
	self assert: element xmiType equals: 'TYPE'