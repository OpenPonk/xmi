tests
testReadFromTypedMapping
	| mapping result uml type |
	mapping := OrderedDictionary
		with: 'UML.xmi' -> self umlTypedElementContents
		with: 'PrimitiveTypes.xmi' -> self umlTypesContents.
	result := OPXMIReader readFromMapping: mapping.
	uml := (result at: 'UML.xmi') containedItems first.
	type := (result at: 'PrimitiveTypes.xmi') containedItems first.
	self assert: uml containedItems first referencedElement equals: type