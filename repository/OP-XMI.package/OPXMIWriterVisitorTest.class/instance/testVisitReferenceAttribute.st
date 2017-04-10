tests
testVisitReferenceAttribute
	visitor writer
		tag: 'outer'
		with: [ visitor
				visitReferenceAttribute:
					(OPXMIReferenceAttribute new
						xmiName: 'key';
						referencedElements:
							{OPXMIObjectElement new
								xmiName: 'whatever';
								containedItems:
									{OPXMIValueAttribute new
										xmiName: 'xmi:id';
										value: 'AAA'}}) ].
	self assert: visitor contents lines last equals: '<outer key="AAA" />'