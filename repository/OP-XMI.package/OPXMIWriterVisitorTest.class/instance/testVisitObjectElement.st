tests
testVisitObjectElement
	visitor
		visitObjectElement:
			(OPXMIObjectElement new
				xmiName: 'Object';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'ID'.
					OPXMIValueElement new
						xmiName: 'body';
						value: 'CONTENT'}).
	self
		assert: visitor contents
		equals:
			'<?xml version="1.0" encoding="UTF-8"?>
<Object xmi:id="ID">
    <body>CONTENT</body>
</Object>'