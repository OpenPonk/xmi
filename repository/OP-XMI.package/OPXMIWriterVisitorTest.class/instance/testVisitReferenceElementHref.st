tests
testVisitReferenceElementHref
	visitor
		visitReferenceElement:
			(OPXMIReferenceElement new
				xmiName: 'name';
				href: 'http://UNIVERSE').
	self assert: visitor contents lines last equals: '<name href="http://UNIVERSE" />'