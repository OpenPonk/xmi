Extension { #name : #OPXMIInfoItems }

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIInfoItems >> asHighlightedTextWrittenWith: aBlock [
	| writer |
	writer := XMLHighlightingWriter new.
	aBlock value: writer.
	^ writer asHighlightedText
]

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIInfoItems >> treeViewLabelText [
	^ self asHighlightedTextWrittenWith: [ :writer | self writeTreeViewLabelXMLOn: writer ]
]

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIInfoItems >> writeTreeViewLabelXMLOn: aWriter [
	self writeXMLOn: aWriter
]

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIInfoItems >> writeXMLOn: aWriter [
]
