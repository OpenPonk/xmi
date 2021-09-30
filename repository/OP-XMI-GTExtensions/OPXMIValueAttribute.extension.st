Extension { #name : #OPXMIValueAttribute }

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIValueAttribute >> writeXMLOn: aWriter [
	aWriter tag: self xmiName with: self value
]
