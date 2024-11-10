Extension { #name : 'OPXMIReferenceElement' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIReferenceElement >> writeXMLOn: aWriter [
	href
		ifNil: [ aWriter tag: self xmiName ]
		ifNotNil: [ aWriter tag: self xmiName attributes: {#href -> href} ]
]
