Extension { #name : #OPXMIReferenceAttribute }

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIReferenceAttribute >> writeXMLOn: aWriter [
	aWriter
		tag: self xmiName
		with: [ self referencedElements do: [ :each | each writeXMLOn: aWriter ] ]
]
