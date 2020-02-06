"
XMIReferenceAttribute is an XML attribute that references an XMIElement by id.
"
Class {
	#name : #OPXMIReferenceAttribute,
	#superclass : #OPXMIAttribute,
	#instVars : [
		'referencedElements',
		'href'
	],
	#category : 'OP-XMI-DOM'
}

{ #category : #'instance creation' }
OPXMIReferenceAttribute class >> xmiName: aName referencedElements: aCollection [
	^ self new
		xmiName: aName;
		referencedElements: aCollection;
		yourself
]

{ #category : #visiting }
OPXMIReferenceAttribute >> accept: aVisitor [
	aVisitor visitReferenceAttribute: self
]

{ #category : #accessing }
OPXMIReferenceAttribute >> href [
	^ href
]

{ #category : #accessing }
OPXMIReferenceAttribute >> href: anObject [
	href := anObject
]

{ #category : #initialization }
OPXMIReferenceAttribute >> initialize [
	super initialize.
	referencedElements := OrderedCollection new
]

{ #category : #testing }
OPXMIReferenceAttribute >> isReferenceAttribute [
	^ true
]

{ #category : #printing }
OPXMIReferenceAttribute >> printOn: aStream [
	aStream
		<< 'XMIReferenceAttribute(';
		<< xmiName;
		<< '")'
]

{ #category : #accessing }
OPXMIReferenceAttribute >> referencedElement [
	^ referencedElements ifEmpty: [ nil ] ifNotEmpty: [ referencedElements first ]
]

{ #category : #accessing }
OPXMIReferenceAttribute >> referencedElements [
	^ referencedElements
]

{ #category : #accessing }
OPXMIReferenceAttribute >> referencedElements: aCollection [
	referencedElements := aCollection
]
