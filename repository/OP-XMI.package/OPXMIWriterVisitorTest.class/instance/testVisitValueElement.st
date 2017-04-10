tests
testVisitValueElement
	visitor visitValueElement: (OPXMIValueElement new xmiName: 'name'; value: 'VALUE').
	self assert: visitor contents lines last equals: '<name>VALUE</name>'