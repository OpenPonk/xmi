Extension { #name : 'OPXMIElement' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIElement >> writeXMLOn: aWriter [
	aWriter tag: self xmiName
]
