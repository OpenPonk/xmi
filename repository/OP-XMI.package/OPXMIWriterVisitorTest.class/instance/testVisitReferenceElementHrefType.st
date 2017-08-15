tests
testVisitReferenceElementHrefType
	visitor
		visitReferenceElement:
			(OPXMIReferenceElement new
				xmiName: 'name';
				xmiType: 'uml:PrimitiveType';
				href: 'http://UNIVERSE').
	self
		assert: visitor contents lines last
		equals: '<name xmi:type="uml:PrimitiveType" href="http://UNIVERSE" />'