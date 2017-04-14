tests
testConstructorAttribute
	| element |
	element := OPXMIValueAttribute xmiName: 'NAME' value: 'VALUE'.
	self assert: element xmiName equals: 'NAME'.
	self assert: element value equals: 'VALUE'