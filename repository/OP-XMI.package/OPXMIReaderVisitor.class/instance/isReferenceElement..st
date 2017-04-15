testing
isReferenceElement: aXMLElement
	| names |
	aXMLElement hasAttributes not | aXMLElement hasElements
		ifTrue: [ ^ false ].
	names := aXMLElement attributeNodes collect: #name.
	^ names allSatisfy: [ :each | #('xmi:idref' 'href' 'xmi:type') includes: each ]