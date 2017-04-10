tests
testVisitValueAttribute
	visitor writer
		tag: 'outer'
		with: [ visitor
				visitValueAttribute:
					(OPXMIValueAttribute new
						xmiName: 'key';
						value: 'VALUE') ].
	self assert: visitor contents lines last equals: '<outer key="VALUE" />'