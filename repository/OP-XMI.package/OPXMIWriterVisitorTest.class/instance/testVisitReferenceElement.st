tests
testVisitReferenceElement
	visitor
		visitReferenceElement:
			(OPXMIReferenceElement new
				xmiName: 'name';
				referencedElements:
					{OPXMIObjectElement new
						xmiName: 'whatever';
						containedItems:
							{OPXMIValueElement new
								xmiName: 'xmi:id';
								value: 'AAA'}}).
	self assert: visitor contents lines last equals: '<name xmi:idref="AAA" />'