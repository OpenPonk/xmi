Extension { #name : #OPXMIObjectElement }

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIObjectElement >> gtInspectorPropertiesIn: aComposite [
	<gtInspectorPresentationOrder: 5>
	aComposite table
		title: 'Properties';
		display: [ self containedItems select: [ :each | each isValueAttribute | each isValueElement ] ];
		column: 'xmiName' evaluated: [ :each | each xmiName ];
		column: 'value' evaluated: [ :each | each value ]
]

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIObjectElement >> gtInspectorTreeIn: aComposite [
	<gtInspectorPresentationOrder: 5>
	aComposite tree
		title: 'Tree';
		allowsRecursiveSearch: false;
		shouldValidate: false;
		display: [ {self} ];
		children: [ :each | 
			each isObjectElement
				ifTrue: [ each containedItems ]
				ifFalse: [ each isReferenceItem
						ifTrue: [ each referencedElements ]
						ifFalse: [ #() ] ] ];
		format: [ :each | each treeViewLabelText ];
		rootsExpanded
]

{ #category : #'*OP-XMI-GTExtensions' }
OPXMIObjectElement >> inspectionProperties [

	<inspectorPresentationOrder: 5 title: 'Tree'>
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
