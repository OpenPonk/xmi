tests
testIsValueElementNot2
	self
		deny:
			(visitor
				isValueElement:
					((XMLElement name: 'el')
						addNode: (XMLElement name: 'child');
						yourself))