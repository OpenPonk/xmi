tests
testIsValueElement
	self
		assert:
			(visitor
				isValueElement:
					(XMLElement new
						name: 'el';
						addString: 'content';
						yourself))