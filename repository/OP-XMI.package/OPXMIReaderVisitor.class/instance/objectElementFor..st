factory
objectElementFor: aXMLElement
	| element |
	element := OPXMIObjectElement new
		xmiName: aXMLElement localName;
		yourself.
	element
		containedItems:
			(aXMLElement attributeNodes collect: [ :attr | self valueAttributeFor: attr ])
				asOrderedCollection.
	unresolved
		add: [ element
				containedItems:
					(aXMLElement attributeNodes collect: [ :attr | self attributeFor: attr ])
						asOrderedCollection, (element containedItems select: #isElement) ].
	^ element