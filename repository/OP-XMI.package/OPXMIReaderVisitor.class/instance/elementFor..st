factory
elementFor: aXMLElement
	(self isValueElement: aXMLElement)
		ifTrue: [ ^ self valueElementFor: aXMLElement ].
	(self isReferenceElement: aXMLElement)
		ifTrue: [ ^ self referenceElementFor: aXMLElement ].
	^ self objectElementFor: aXMLElement