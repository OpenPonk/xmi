testing
isValueElement: aXMLElement
	aXMLElement hasAttributes
		ifTrue: [ ^ false ].
	aXMLElement nodes size = 0
		ifTrue: [ ^ true ].
	^ aXMLElement nodes size = 1 and: [ aXMLElement nodes first isStringNode ]