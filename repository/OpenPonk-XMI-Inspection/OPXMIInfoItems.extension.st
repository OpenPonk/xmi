Extension { #name : 'OPXMIInfoItems' }

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIInfoItems >> treeViewLabelText [

	| writer |
	writer := XMLWriter new.
	self writeTreeViewLabelXMLOn: writer.
	^ writer contents
]

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIInfoItems >> writeTreeViewLabelXMLOn: aWriter [
	self writeXMLOn: aWriter
]

{ #category : '*OpenPonk-XMI-Inspection' }
OPXMIInfoItems >> writeXMLOn: aWriter [

	self subclassResponsibility
]
