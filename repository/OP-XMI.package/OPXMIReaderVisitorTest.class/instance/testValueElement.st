tests
testValueElement
	result := visitor
		valueElementFor:
			(XMLElement new
				name: 'el';
				addString: 'content';
				yourself).
	self assert: result xmiName equals: 'el'.
	self assert: result value equals: 'content'