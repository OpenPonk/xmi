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
