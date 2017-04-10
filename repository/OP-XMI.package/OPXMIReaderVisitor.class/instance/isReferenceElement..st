testing
isReferenceElement: aXMLElement
	aXMLElement hasAttributes not | aXMLElement hasElements
		ifTrue: [ ^ false ].
	aXMLElement attributes size > 1
		ifTrue: [ ^ false ].
	^ aXMLElement attributeNodes first name = 'xmi:idref'
		| (aXMLElement attributeNodes first name = 'href')