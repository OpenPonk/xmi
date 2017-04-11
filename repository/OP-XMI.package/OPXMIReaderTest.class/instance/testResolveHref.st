tests
testResolveHref
	| reference map someFileXmi |
	reference := OPXMIReferenceElement new
		xmiName: 'reference';
		href: 'someFile.xmi#AAA'.
	someFileXmi := OPXMIObjectElement new
		xmiName: 'container';
		containedItems:
			{OPXMIObjectElement new
				xmiName: 'item';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'AAA'}}.
	map := Dictionary with: 'someFile.xmi' -> someFileXmi.
	OPXMIReader new resolveHrefIn: reference with: map.
	self assert: reference referencedElements size equals: 1.
	self assert: reference referencedElement equals: someFileXmi containedItem