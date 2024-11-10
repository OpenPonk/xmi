Extension { #name : 'OPXMIValueAttribute' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIValueAttribute >> writeXMLOn: aWriter [
	aWriter tag: self xmiName with: self value
]
