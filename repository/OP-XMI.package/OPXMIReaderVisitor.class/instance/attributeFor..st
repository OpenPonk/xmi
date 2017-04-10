factory
attributeFor: aXMLAttribute
	(self isReferenceAttribute: aXMLAttribute)
		ifTrue: [ ^ self referenceAttributeFor: aXMLAttribute ].
	^ self valueAttributeFor: aXMLAttribute