Extension { #name : #OPXMIObjectElement }

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIObjectElement >> inspectionProperties [

	"<inspectorPresentationOrder: 5 title: 'Tree'>"
	^ SpTreePresenter new
		  roots: { self };
		  children: [ :each | 
			  each isObjectElement
				  ifTrue: [ each containedItems ]
				  ifFalse: [ 
					  each isReferenceItem
						  ifTrue: [ each referencedElements ]
						  ifFalse: [ #(  ) ] ] ];
		  display: [ :each | each treeViewLabelText ];
		  yourself
]

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIObjectElement >> writeXMLOn: aWriter [
	aWriter
		tag: self xmiName
		attributes:
			({#xmi:id -> self xmiId.
			#xmi:type -> self xmiType} select: [:pair | pair value isNotNil])
]
