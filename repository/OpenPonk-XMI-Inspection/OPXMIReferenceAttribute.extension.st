Extension { #name : 'OPXMIReferenceAttribute' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIReferenceAttribute >> writeXMLOn: aWriter [
	aWriter
		tag: self xmiName
		with: [ self referencedElements do: [ :each | each writeXMLOn: aWriter ] ]
]
