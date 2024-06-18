Extension { #name : 'OPXMIValueElement' }

{ #category : '*OP-XMI-GTExtensions' }
OPXMIValueElement >> writeXMLOn: aWriter [
	aWriter tag: self xmiName with: self value
]
