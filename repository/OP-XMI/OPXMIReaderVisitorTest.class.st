Class {
	#name : #OPXMIReaderVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'result'
	],
	#category : 'OP-XMI-Tests'
}

{ #category : #'instance creation' }
OPXMIReaderVisitorTest >> elementNamed: aName [
	^ XMLElement named: aName
]

{ #category : #'instance creation' }
OPXMIReaderVisitorTest >> elementNamed: aName attributes: aCollection [
	^ (XMLElement named: aName)
		usesNamespaces: false;
		setAttributes: aCollection;
		yourself
]

{ #category : #running }
OPXMIReaderVisitorTest >> setUp [
	super setUp.
	visitor := OPXMIReaderVisitor new
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceAttribute [
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID')).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'ID'}).
	self assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID'))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceAttributeMulti [
	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID1 ID2')).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'ID1'}).
	visitor visitElement: (self elementNamed: 'whatever' attributes: {#xmi:id -> 'ID2'}).
	self
		assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'ID1 ID2'))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceAttributeNotXmi [
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'xmi:idref' value: 'value')).
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'xmi:id' value: 'value'))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceElementHref [
	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {#href -> #content}))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceElementHref2 [
	self
		assert:
			(visitor
				isReferenceElement:
					(self
						elementNamed: 'el'
						attributes:
							{#xmi:type -> 'type'.
							#href -> #content}))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceElementIdRef [
	self
		assert: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {#xmi:idref -> #value}))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsReferenceElementNot [
	self
		deny: (visitor isReferenceElement: (self elementNamed: 'el' attributes: {#other -> #sth}))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsValueElement [
	self
		assert:
			(visitor
				isValueElement:
					(XMLElement new
						name: 'el';
						addString: 'content';
						yourself))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsValueElementNot [
	self deny: (visitor isValueElement: (XMLElement name: 'el' attributes: {#key -> #value}))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testIsValueElementNot2 [
	self
		deny:
			(visitor
				isValueElement:
					((XMLElement name: 'el')
						addNode: (XMLElement name: 'child');
						yourself))
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testObjectElement [
	result := visitor objectElementFor: (self elementNamed: 'el').
	self assert: result isObjectElement.
	self assert: result xmiName equals: 'el'
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testObjectElementWithAttributes [
	result := visitor
		objectElementFor: (self elementNamed: 'el' attributes: {#name -> #value}).
	self assert: result xmiName equals: 'el'.
	self assert: result containedItems size equals: 1.
	self assert: result containedItems first isValueAttribute.
	self assert: result containedItems first xmiName equals: 'name'.
	self assert: result containedItems first value equals: 'value'
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testReferenceAttribute [
	| target reference attribute |
	target := self elementNamed: 'Target' attributes: {#xmi:id -> #target}.
	reference := self elementNamed: 'Reference' attributes: {#object -> #target}.
	visitor visitElement: reference.
	visitor visitElement: target.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result containedItems size equals: 1.
	attribute := result containedItem.
	self assert: attribute isReferenceAttribute.
	self assert: attribute referencedElements size equals: 1.
	self assert: attribute referencedElement equals: (visitor elementAt: target)
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testReferenceAttributeMulti [
	| target1 target2 reference attribute |
	target1 := self elementNamed: 'Target' attributes: {#xmi:id -> #target1}.
	target2 := self elementNamed: 'Target' attributes: {#xmi:id -> #target2}.
	reference := self elementNamed: 'Reference' attributes: {#object -> 'target1 target2'}.
	visitor visitElement: reference.
	visitor visitElement: target1.
	visitor visitElement: target2.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result containedItems size equals: 1.
	attribute := result containedItem.
	self assert: attribute isReferenceAttribute.
	self assert: attribute referencedElements size equals: 2.
	self assert: attribute referencedElements first equals: (visitor elementAt: target1).
	self assert: attribute referencedElements second equals: (visitor elementAt: target2)
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testReferenceElement [
	| target reference |
	target := self elementNamed: 'Target' attributes: {#xmi:id -> #target}.
	reference := self elementNamed: 'Reference' attributes: {#xmi:idref -> #target}.
	visitor visitElement: target.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result isReferenceElement.
	self assert: result referencedElements size equals: 1.
	self assert: result referencedElement equals: (visitor elementAt: target)
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testReferenceElementHrefUnresolved [
	| reference |
	reference := self
		elementNamed: 'importedPackage'
		attributes: {#href -> 'http://www.omg.org/spec/DD/20131001/DI.xmi#_0'}.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result isReferenceElement.
	self assert: result href equals: 'http://www.omg.org/spec/DD/20131001/DI.xmi#_0'.
	self assert: result referencedElements size equals: 0
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testReferenceElementHrefUnresolvedWithType [
	| reference |
	reference := self
		elementNamed: 'type'
		attributes:
			{#xmi:type -> 'uml:PrimitiveType'.
			#href -> 'PrimitiveTypes.xmi#String'}.
	visitor visitElement: reference.
	visitor resolveAll.
	result := visitor elementAt: reference.
	self assert: result isReferenceElement.
	self assert: result href equals: 'PrimitiveTypes.xmi#String'.
	self assert: result xmiType equals: 'uml:PrimitiveType'.
	self assert: result referencedElements size equals: 0
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testValueAttribute [
	result := visitor valueAttributeFor: (XMLAttribute name: 'name' value: 'value').
	self assert: result isValueAttribute.
	self assert: result xmiName equals: 'name'.
	self assert: result value equals: 'value'
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testValueElement [
	result := visitor
		valueElementFor:
			(XMLElement new
				name: 'el';
				addString: 'content';
				yourself).
	self assert: result isValueElement.
	self assert: result xmiName equals: 'el'.
	self assert: result value equals: 'content'
]

{ #category : #tests }
OPXMIReaderVisitorTest >> testVisitObjectElementWithChild [
	| node |
	node := (self elementNamed: 'parent' attributes: {#xmi:type -> 'type'})
		addNode: (self elementNamed: 'child');
		yourself.
	visitor visitElement: node.
	result := visitor elementAt: node.
	self assert: result xmiName equals: 'parent'.
	self assert: result containedItems size equals: 2.
	self assert: result containedItems second isElement.
	self assert: result containedItems second xmiName equals: 'child'
]
