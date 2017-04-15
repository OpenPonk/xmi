tests
testIsReferenceElementHref2
	self
		assert:
			(visitor
				isReferenceElement:
					(self
						elementNamed: 'el'
						attributes:
							{#xmi:type -> 'type'.
							#href -> #content}))