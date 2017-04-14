tests
testConstructorElement
	|element|
	element := OPXMIValueElement xmiName: 'NAME' value: 'VALUE'.
	self assert: element xmiName equals: 'NAME'.
	self assert: element value equals: 'VALUE'