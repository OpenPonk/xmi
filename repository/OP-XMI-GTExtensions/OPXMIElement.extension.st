Extension { #name : #OPXMIElement }

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIElement >> writeXMLOn: aWriter [
	aWriter tag: self xmiName
]
