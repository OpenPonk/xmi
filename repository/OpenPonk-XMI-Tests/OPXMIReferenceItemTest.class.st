"
I am a unit test class verifying the instantiation, initialization, and structure of XMI reference attributes and elements.
"
Class {
	#name : 'OPXMIReferenceItemTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests-DOM',
	#package : 'OpenPonk-XMI-Tests',
	#tag : 'DOM'
}

{ #category : 'tests' }
OPXMIReferenceItemTest >> testConstructorAttribute [
	| element |
	element := OPXMIReferenceAttribute xmiName: 'NAME' referencedElements: #(1).
	self assert: element xmiName equals: 'NAME'.
	self assert: element referencedElements equals: #(1)
]

{ #category : 'tests' }
OPXMIReferenceItemTest >> testConstructorElement [
	| element |
	element := OPXMIReferenceElement xmiName: 'NAME' referencedElements: #(1).
	self assert: element xmiName equals: 'NAME'.
	self assert: element referencedElements equals: #(1)
]

{ #category : 'tests' }
OPXMIReferenceItemTest >> testPrintOn [

	| attribute |
	attribute := OPXMIReferenceAttribute xmiName: 'ref' referencedElements: #(  ).
	self assert: attribute printString equals: 'XMIReferenceAttribute(ref)'.
	self assert: OPXMIReferenceAttribute new printString equals: 'XMIReferenceAttribute()'
]

{ #category : 'tests' }
OPXMIReferenceItemTest >> testReferenceAttributeHrefIsNil [

	self assert: OPXMIReferenceAttribute new href identicalTo: nil
]

{ #category : 'tests' }
OPXMIReferenceItemTest >> testReferencedElement [

	| target attribute element |
	target := OPXMIObjectElement new xmiName: 'target'.
	attribute := OPXMIReferenceAttribute new xmiName: 'ref'.
	self assert: attribute referencedElement identicalTo: nil.
	attribute referencedElements: { target }.
	self assert: attribute referencedElement identicalTo: target.
	element := OPXMIReferenceElement new xmiName: 'ref'.
	self assert: element referencedElement identicalTo: nil.
	element referencedElements: { target }.
	self assert: element referencedElement identicalTo: target
]

{ #category : 'tests' }
OPXMIReferenceItemTest >> testTypePredicates [

	| attribute element |
	attribute := OPXMIReferenceAttribute new.
	self assert: attribute isAttribute description: 'Reference attribute must be an attribute'.
	self assert: attribute isReferenceAttribute description: 'Reference attribute must report isReferenceAttribute'.
	self assert: attribute isReferenceItem description: 'Reference attribute must report isReferenceItem'.
	self deny: attribute isElement description: 'Reference attribute must not be an element'.
	self deny: attribute isReferenceElement description: 'Reference attribute must not be a reference element'.
	self deny: attribute isValueItem description: 'Reference attribute must not be a value item'.
	element := OPXMIReferenceElement new.
	self assert: element isElement description: 'Reference element must be an element'.
	self assert: element isReferenceElement description: 'Reference element must report isReferenceElement'.
	self assert: element isReferenceItem description: 'Reference element must report isReferenceItem'.
	self deny: element isAttribute description: 'Reference element must not be an attribute'.
	self deny: element isReferenceAttribute description: 'Reference element must not be a reference attribute'.
	self deny: element isValueItem description: 'Reference element must not be a value item'
]
