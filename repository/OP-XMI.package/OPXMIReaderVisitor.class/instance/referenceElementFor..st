factory
referenceElementFor: aXMLElement
	| el attribute |
	(el := OPXMIReferenceElement new) xmiName: aXMLElement localName.
	attribute := aXMLElement attributeNodes detect: [ :each | each name = 'href' ].
	attribute name = 'href'
		ifTrue: [ el href: attribute value ]
		ifFalse: [ unresolved add: [ el referencedElements: {refIdMapping at: attribute value} ] ].
	^ el