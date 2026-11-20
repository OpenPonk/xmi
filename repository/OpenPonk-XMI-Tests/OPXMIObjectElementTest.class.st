"
I am a unit test class verifying the behavior of OPXMIObjectElement, particularly focusing on identifier lookups, nested containment, and property resolution.
"
Class {
	#name : 'OPXMIObjectElementTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests-DOM',
	#package : 'OpenPonk-XMI-Tests',
	#tag : 'DOM'
}

{ #category : 'instance creation' }
OPXMIObjectElementTest >> nestedObjects [
	^ OPXMIObjectElement new
		xmiName: 'aaa';
		containedItems:
			{OPXMIValueAttribute new
				xmiName: 'xmi:id';
				value: 'AAA'.
			OPXMIObjectElement new
				xmiName: 'bbb';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'BBB'}.
			OPXMIObjectElement new
				xmiName: 'ccc';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'CCC'.
					OPXMIObjectElement new
						xmiName: 'ddd';
						containedItems:
							{OPXMIValueAttribute new
								xmiName: 'xmi:id';
								value: 'DDD'}}}
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testAbstractClasses [

	self assert: OPXMIInfoItems isAbstract description: 'OPXMIInfoItems must be abstract'.
	self assert: OPXMIAttribute isAbstract description: 'OPXMIAttribute must be abstract'.
	self assert: OPXMIElement isAbstract description: 'OPXMIElement must be abstract'.
	self deny: OPXMIObjectElement isAbstract description: 'OPXMIObjectElement must be concrete'.
	self deny: OPXMIReferenceAttribute isAbstract description: 'OPXMIReferenceAttribute must be concrete'.
	self deny: OPXMIReferenceElement isAbstract description: 'OPXMIReferenceElement must be concrete'.
	self deny: OPXMIValueAttribute isAbstract description: 'OPXMIValueAttribute must be concrete'.
	self deny: OPXMIValueElement isAbstract description: 'OPXMIValueElement must be concrete'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testContainedItem [

	| element child |
	element := OPXMIObjectElement new xmiName: 'container'.
	self assert: element containedItem identicalTo: nil.
	child := OPXMIObjectElement new xmiName: 'child'.
	element containedItems: { child }.
	self assert: element containedItem identicalTo: child
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testElementNamed [

	| el |
	(el := OPXMIObjectElement new)
		xmiName: 'container';
		containedItems: { (OPXMIObjectElement new xmiName: 'element') }.
	self assert: (el elementNamed: 'element') xmiName equals: 'element'.
	self assert: (el elementNamed: 'none') identicalTo: nil
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testFindElementWithXmiId1 [

	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'AAA'.
	self assert: result identicalTo: root
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testFindElementWithXmiId2 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'BBB'.
	self assert: result xmiName equals: 'bbb'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testFindElementWithXmiId3 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'CCC'.
	self assert: result xmiName equals: 'ccc'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testFindElementWithXmiId4 [
	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'DDD'.
	self assert: result xmiName equals: 'ddd'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testFindElementWithXmiId5 [

	| root result |
	root := self nestedObjects.
	result := root findElementWithXmiId: 'EEE'.
	self assert: result identicalTo: nil
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testId [

	| element |
	element := OPXMIObjectElement new.
	self assert: element xmiId identicalTo: nil.
	element containedItems: { (OPXMIValueAttribute new
			 xmiName: #'xmi:id';
			 value: 'ID') }.
	self assert: element xmiId equals: 'ID'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testNameValue [
	| element |
	element := OPXMIObjectElement new
		containedItems: {OPXMIValueElement xmiName: 'name' value: 'hello'}.
	self assert: element nameValue equals: 'hello'.
	self should: [ OPXMIObjectElement new nameValue ] raise: NotFound
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testPrintOn [

	| element |
	element := OPXMIObjectElement new
		           xmiName: 'Class';
		           containedItems: {
				           (OPXMIValueAttribute xmiName: #'xmi:id' value: 'ID1').
				           (OPXMIValueAttribute xmiName: #'xmi:type' value: 'uml:Class') }.
	self assert: element printString equals: 'XMIObjectElement(Class xmi:id="ID1" xmi:type="uml:Class")'.
	self assert: (OPXMIObjectElement new xmiName: 'Plain') printString equals: 'XMIObjectElement(Plain)'.
	self assert: OPXMIObjectElement new printString equals: 'XMIObjectElement()'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testType [

	| element |
	element := OPXMIObjectElement new.
	self assert: element xmiType identicalTo: nil.
	element containedItems: { (OPXMIValueAttribute new
			 xmiName: #'xmi:type';
			 value: 'TYPE') }.
	self assert: element xmiType equals: 'TYPE'
]

{ #category : 'tests' }
OPXMIObjectElementTest >> testTypePredicates [

	| element |
	element := OPXMIObjectElement new.
	self assert: element isElement description: 'Object element must be an element'.
	self assert: element isObjectElement description: 'Object element must report isObjectElement'.
	self deny: element isAttribute description: 'Object element must not be an attribute'.
	self deny: element isReferenceAttribute description: 'Object element must not be a reference attribute'.
	self deny: element isReferenceElement description: 'Object element must not be a reference element'.
	self deny: element isReferenceItem description: 'Object element must not be a reference item'.
	self deny: element isValueAttribute description: 'Object element must not be a value attribute'.
	self deny: element isValueElement description: 'Object element must not be a value element'.
	self deny: element isValueItem description: 'Object element must not be a value item'
]
