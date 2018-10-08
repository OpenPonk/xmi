Class {
	#name : #OPXMIReferenceItemTest,
	#superclass : #TestCase,
	#category : 'OP-XMI-Tests'
}

{ #category : #tests }
OPXMIReferenceItemTest >> testConstructorAttribute [
	| element |
	element := OPXMIReferenceAttribute xmiName: 'NAME' referencedElements: #(1).
	self assert: element xmiName equals: 'NAME'.
	self assert: element referencedElements equals: #(1)
]

{ #category : #tests }
OPXMIReferenceItemTest >> testConstructorElement [
	| element |
	element := OPXMIReferenceElement xmiName: 'NAME' referencedElements: #(1).
	self assert: element xmiName equals: 'NAME'.
	self assert: element referencedElements equals: #(1)
]
