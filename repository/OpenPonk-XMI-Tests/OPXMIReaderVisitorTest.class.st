"
I am a unit test class verifying the accurate translation of various XML DOM nodes into specific OPXMI elements and attributes by OPXMIReaderVisitor.
"
Class {
	#name : 'OPXMIReaderVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor',
		'result'
	],
	#category : 'OpenPonk-XMI-Tests-Reader',
	#package : 'OpenPonk-XMI-Tests',
	#tag : 'Reader'
}

{ #category : 'instance creation' }
OPXMIReaderVisitorTest >> elementNamed: aName [
	^ XMLElement named: aName
]

{ #category : 'instance creation' }
OPXMIReaderVisitorTest >> elementNamed: aName attributes: aCollection [
	^ (XMLElement named: aName)
		usesNamespaces: false;
		setAttributes: aCollection;
		yourself
]

{ #category : 'running' }
OPXMIReaderVisitorTest >> setUp [
	super setUp.
	visitor := OPXMIReaderVisitor new
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testEmptyObjectElementWithOnlyXmiType [

	| document |
	document := XMLDOMParser parse: '<packagedElement xmi:type="uml:Class"/>' usingNamespaces: false.
	result := visitor visitDocument: document.
	self assert: result class identicalTo: OPXMIObjectElement.
	self assert: result xmiName equals: 'packagedElement'.
	self assert: result xmiType equals: 'uml:Class'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceAttribute [

	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID'))
		description: 'Attribute whose value is not a registered xmi:id must not be a reference attribute'.
	visitor visitElement: (self elementNamed: 'whatever' attributes: { (#'xmi:id' -> 'ID') }).
	self
		assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID'))
		description: 'Attribute whose value matches a registered xmi:id must be recognized as a reference attribute'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceAttributeMulti [

	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID1 ID2'))
		description: 'Multi-value attribute must not be a reference attribute before targets are visited'.
	visitor visitElement: (self elementNamed: 'whatever' attributes: { (#'xmi:id' -> 'ID1') }).
	visitor visitElement: (self elementNamed: 'whatever' attributes: { (#'xmi:id' -> 'ID2') }).
	self
		assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID1 ID2'))
		description: 'Multi-value attribute must be recognized as a reference attribute when all IDs are registered'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceAttributeNotXmi [

	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'xmi:idref' value: 'value'))
		description: 'xmi:idref attribute must not be treated as a reference attribute'.
	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'xmi:id' value: 'value'))
		description: 'xmi:id attribute must not be treated as a reference attribute'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceElementHref [

	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: { (#href -> #content) }))
		description: 'Element with href attribute must be recognized as a reference element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceElementHref2 [

	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {
						  (#'xmi:type' -> 'type').
						  (#href -> #content) }))
		description: 'Element with xmi:type and href attributes must be recognized as a reference element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceElementIdRef [

	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: { (#'xmi:idref' -> #value) }))
		description: 'Element with xmi:idref attribute must be recognized as a reference element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceElementNot [

	self
		deny: (visitor isReferenceElement: (self elementNamed: 'el' attributes: { (#other -> #sth) }))
		description: 'Element with arbitrary non-reference attributes must not be treated as a reference element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsReferenceElementNotOnlyXmiType [

	self
		deny: (visitor isReferenceElement: (self elementNamed: 'packagedElement' attributes: { (#'xmi:type' -> 'uml:Class') }))
		description: 'Element with only xmi:type and no href or xmi:idref must not be treated as a reference element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsValueElement [

	self
		assert: (visitor isValueElement: (XMLElement new
					  name: 'el';
					  addString: 'content';
					  yourself))
		description: 'Attribute-less element with string content must be recognized as a value element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsValueElementNot [

	self
		deny: (visitor isValueElement: (XMLElement name: 'el' attributes: { (#key -> #value) }))
		description: 'Element with attributes must not be recognized as a value element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testIsValueElementNot2 [

	self
		deny: (visitor isValueElement: ((XMLElement name: 'el')
					  addNode: (XMLElement name: 'child');
					  yourself))
		description: 'Element with child elements must not be recognized as a value element'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testObjectElement [

	result := visitor objectElementFor: (self elementNamed: 'el').
	self assert: result class identicalTo: OPXMIObjectElement.
	self assert: result xmiName equals: 'el'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testObjectElementWithAttributes [

	result := visitor objectElementFor: (self elementNamed: 'el' attributes: { (#name -> #value) }).
	self assert: result class identicalTo: OPXMIObjectElement.
	self assert: result xmiName equals: 'el'.
	self assert: result containedItems asArray equals: { (OPXMIValueAttribute xmiName: 'name' value: 'value') }
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testReferenceAttribute [

	| target reference attribute |
	target := self elementNamed: 'Target' attributes: { (#'xmi:id' -> #target) }.
	reference := self elementNamed: 'Reference' attributes: { (#object -> #target) }.
	visitor visitElement: reference.
	visitor visitElement: target.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: (result containedItems collect: #class as: Array) equals: { OPXMIReferenceAttribute }.
	attribute := result containedItem.
	self assert: attribute xmiName equals: 'object'.
	self assert: attribute referencedElements asArray equals: { (visitor elementAt: target) }.
	self assert: attribute referencedElement identicalTo: (visitor elementAt: target)
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testReferenceAttributeMulti [

	| target1 target2 reference attribute |
	target1 := self elementNamed: 'Target' attributes: { (#'xmi:id' -> #target1) }.
	target2 := self elementNamed: 'Target' attributes: { (#'xmi:id' -> #target2) }.
	reference := self elementNamed: 'Reference' attributes: { (#object -> 'target1 target2') }.
	visitor visitElement: reference.
	visitor visitElement: target1.
	visitor visitElement: target2.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: (result containedItems collect: #class as: Array) equals: { OPXMIReferenceAttribute }.
	attribute := result containedItem.
	self assert: attribute xmiName equals: 'object'.
	self assert: attribute referencedElements asArray equals: {
			(visitor elementAt: target1).
			(visitor elementAt: target2) }
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testReferenceElement [

	| target reference |
	target := self elementNamed: 'Target' attributes: { (#'xmi:id' -> #target) }.
	reference := self elementNamed: 'Reference' attributes: { (#'xmi:idref' -> #target) }.
	visitor visitElement: target.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result class identicalTo: OPXMIReferenceElement.
	self assert: result xmiName equals: 'Reference'.
	self assert: result referencedElements asArray equals: { (visitor elementAt: target) }.
	self assert: result referencedElement identicalTo: (visitor elementAt: target)
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testReferenceElementHrefUnresolved [

	| reference |
	reference := self elementNamed: 'importedPackage' attributes: { (#href -> 'http://www.omg.org/spec/DD/20131001/DI.xmi#_0') }.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result class identicalTo: OPXMIReferenceElement.
	self assert: result href equals: 'http://www.omg.org/spec/DD/20131001/DI.xmi#_0'.
	self assertEmpty: result referencedElements
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testReferenceElementHrefUnresolvedWithType [

	| reference |
	reference := self elementNamed: 'type' attributes: {
			             (#'xmi:type' -> 'uml:PrimitiveType').
			             (#href -> 'PrimitiveTypes.xmi#String') }.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result class identicalTo: OPXMIReferenceElement.
	self assert: result href equals: 'PrimitiveTypes.xmi#String'.
	self assert: result xmiType equals: 'uml:PrimitiveType'.
	self assertEmpty: result referencedElements
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testValueAttribute [

	result := visitor valueAttributeFor: (XMLAttribute name: 'name' value: 'value').
	self assert: result class identicalTo: OPXMIValueAttribute.
	self assert: result xmiName equals: 'name'.
	self assert: result value equals: 'value'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testValueElement [

	result := visitor valueElementFor: (XMLElement new
			           name: 'el';
			           addString: 'content';
			           yourself).
	self assert: result class identicalTo: OPXMIValueElement.
	self assert: result xmiName equals: 'el'.
	self assert: result value equals: 'content'
]

{ #category : 'tests' }
OPXMIReaderVisitorTest >> testVisitObjectElementWithChild [

	| node |
	node := (self elementNamed: 'parent' attributes: { (#'xmi:type' -> 'type') })
		        addNode: (self elementNamed: 'child');
		        yourself.
	visitor visitElement: node.
	result := visitor elementAt: node.
	self assert: result xmiName equals: 'parent'.
	self assert: (result containedItems collect: #class as: Array) equals: {
			OPXMIValueAttribute.
			OPXMIValueElement }.
	self assert: result containedItems second xmiName equals: 'child'.
	self assertEmpty: result containedItems second value
]
