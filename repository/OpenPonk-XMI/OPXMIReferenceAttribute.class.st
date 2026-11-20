"
I represent an XMI XML attribute that references one or more XMI elements by their identifier (`xmi:idref`).
"
Class {
	#name : 'OPXMIReferenceAttribute',
	#superclass : 'OPXMIAttribute',
	#instVars : [
		'referencedElements'
	],
	#category : 'OpenPonk-XMI-DOM',
	#package : 'OpenPonk-XMI',
	#tag : 'DOM'
}

{ #category : 'instance creation' }
OPXMIReferenceAttribute class >> xmiName: aName referencedElements: aCollection [
	^ self new
		xmiName: aName;
		referencedElements: aCollection;
		yourself
]

{ #category : 'visiting' }
OPXMIReferenceAttribute >> accept: aVisitor [
	aVisitor visitReferenceAttribute: self
]

{ #category : 'accessing' }
OPXMIReferenceAttribute >> href [

	^ nil
]

{ #category : 'initialization' }
OPXMIReferenceAttribute >> initialize [
	super initialize.
	referencedElements := OrderedCollection new
]

{ #category : 'testing' }
OPXMIReferenceAttribute >> isReferenceAttribute [
	^ true
]

{ #category : 'printing' }
OPXMIReferenceAttribute >> printOn: aStream [

	aStream << 'XMIReferenceAttribute('.
	xmiName ifNotNil: [ aStream << xmiName ].
	aStream << ')'
]

{ #category : 'accessing' }
OPXMIReferenceAttribute >> referencedElement [
	^ referencedElements ifEmpty: [ nil ] ifNotEmpty: [ referencedElements first ]
]

{ #category : 'accessing' }
OPXMIReferenceAttribute >> referencedElements [
	^ referencedElements
]

{ #category : 'accessing' }
OPXMIReferenceAttribute >> referencedElements: aCollection [
	referencedElements := aCollection
]
