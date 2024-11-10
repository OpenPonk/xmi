Extension { #name : 'OPXMIValueElement' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIValueElement >> writeXMLOn: aWriter [
	aWriter tag: self xmiName with: self value
]
