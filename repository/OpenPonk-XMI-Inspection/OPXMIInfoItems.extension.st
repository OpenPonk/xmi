Extension { #name : 'OPXMIInfoItems' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIInfoItems >> treeViewLabelText [
	^ self asHighlightedTextWrittenWith: [ :writer | self writeTreeViewLabelXMLOn: writer ]
]

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIInfoItems >> writeTreeViewLabelXMLOn: aWriter [
	self writeXMLOn: aWriter
]

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIInfoItems >> writeXMLOn: aWriter [
]
