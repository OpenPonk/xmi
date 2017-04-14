*OP-XMI-GTExtensions
gtInspectorTreeIn: aComposite
	<gtInspectorPresentationOrder: 5>
	aComposite tree
		title: 'Tree';
		display: [ {self} ];
		children: [ :each | 
			each isObjectElement
				ifTrue: [ each containedItems ]
				ifFalse: [ each isReferenceItem
						ifTrue: [ #()"each referencedElements" ]
						ifFalse: [ #() ] ] ];
		format: [ :each | each treeViewLabelText ];
		rootsExpanded