"
Tests inspector tree presentation and XML label formatting for XMI information items.
"
Class {
	#name : 'OPXMIInspectionTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Inspection-Tests-Inspection',
	#package : 'OpenPonk-XMI-Inspection-Tests',
	#tag : 'Inspection'
}

{ #category : 'tests' }
OPXMIInspectionTest >> testAbstractInfoItemsWriteXMLOnSignalsSubclassResponsibility [

	self should: [ OPXMIInfoItems new writeXMLOn: XMLWriter new ] raise: SubclassResponsibility
]

{ #category : 'tests' }
OPXMIInspectionTest >> testInspectionPropertiesPresentation [

	| target referenceAttribute referenceElement valueElement root presenter pragma |
	target := OPXMIObjectElement new
		          xmiName: 'Target';
		          containedItems: { (OPXMIValueAttribute xmiName: #'xmi:id' value: 'T1') }.
	referenceAttribute := OPXMIReferenceAttribute xmiName: 'refAttr' referencedElements: { target }.
	referenceElement := OPXMIReferenceElement xmiName: 'refElem' referencedElements: { target }.
	valueElement := OPXMIValueElement xmiName: 'body' value: 'text'.
	root := OPXMIObjectElement new
		        xmiName: 'Root';
		        containedItems: {
				        referenceAttribute.
				        referenceElement.
				        valueElement }.
	pragma := OPXMIObjectElement >> #inspectionProperties: pragmaAt: #inspectorPresentationOrder:title:.
	self assert: pragma isNotNil description: 'inspectionProperties: must carry inspectorPresentationOrder:title: pragma'.
	presenter := root inspectionProperties: SpPresenter new.
	self assert: presenter roots equals: { root }.
	self assert: (presenter childrenFor: root) equals: root containedItems.
	self assert: (presenter childrenFor: referenceAttribute) equals: { target }.
	self assert: (presenter childrenFor: referenceElement) equals: { target }.
	self assertEmpty: (presenter childrenFor: valueElement).
	self assert: (presenter display value: root) equals: root treeViewLabelText
]

{ #category : 'tests' }
OPXMIInspectionTest >> testObjectElementTreeViewLabelText [

	| element plain |
	element := OPXMIObjectElement new
		           xmiName: 'Class';
		           containedItems: {
				           (OPXMIValueAttribute xmiName: #'xmi:id' value: 'ID1').
				           (OPXMIValueAttribute xmiName: #'xmi:type' value: 'uml:Class') }.
	self assert: element treeViewLabelText equals: '<Class xmi:id="ID1" xmi:type="uml:Class"/>'.
	plain := OPXMIObjectElement new xmiName: 'Package'.
	self assert: plain treeViewLabelText equals: '<Package/>'
]

{ #category : 'tests' }
OPXMIInspectionTest >> testReferenceAttributeTreeViewLabelText [

	| target attribute |
	target := OPXMIObjectElement new
		          xmiName: 'Class';
		          containedItems: { (OPXMIValueAttribute xmiName: #'xmi:id' value: 'C1') }.
	attribute := OPXMIReferenceAttribute xmiName: 'memberEnd' referencedElements: { target }.
	self assert: attribute treeViewLabelText equals: '<memberEnd><Class xmi:id="C1"/></memberEnd>'
]

{ #category : 'tests' }
OPXMIInspectionTest >> testReferenceElementTreeViewLabelText [

	| withHref withoutHref |
	withHref := OPXMIReferenceElement new
		            xmiName: 'type';
		            href: 'PrimitiveTypes.xmi#String'.
	withoutHref := OPXMIReferenceElement new xmiName: 'general'.
	self assert: withHref treeViewLabelText equals: '<type href="PrimitiveTypes.xmi#String"/>'.
	self assert: withoutHref treeViewLabelText equals: '<general/>'
]

{ #category : 'tests' }
OPXMIInspectionTest >> testValueItemsTreeViewLabelText [

	| attribute element |
	attribute := OPXMIValueAttribute xmiName: 'name' value: 'Person'.
	element := OPXMIValueElement xmiName: 'body' value: 'Hello'.
	self assert: attribute treeViewLabelText equals: '<name>Person</name>'.
	self assert: element treeViewLabelText equals: '<body>Hello</body>'
]
