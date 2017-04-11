tests
testNoSelfReferenceIsReferenceAttributeNot
	"goes with testNoSelfReference"

	| element |
	element := self
		elementNamed: 'whatever'
		attributes:
			{#xmi:id -> 'NAME'.
			#name -> 'NAME'}.
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'NAME')).
	visitor visitElement: element.
	self assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'NAME')).
	self deny: (visitor isReferenceAttribute: (element attributeNodeAt: 'name'))