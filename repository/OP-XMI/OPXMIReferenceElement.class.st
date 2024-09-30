"
XMIReferenceElement is an XML element with an idref or href attribute that references another XMIElement, by id, URI, or URI and XPointer.
"
Class {
	#name : 'OPXMIReferenceElement',
	#superclass : 'OPXMIElement',
	#instVars : [
		'referencedElements',
		'href',
		'xmiType'
	],
	#category : 'OP-XMI-DOM',
	#package : 'OP-XMI',
	#tag : 'DOM'
}

{ #category : 'instance creation' }
OPXMIReferenceElement class >> xmiName: aName referencedElements: aCollection [
	^ self new
		xmiName: aName;
		referencedElements: aCollection;
		yourself
]

{ #category : 'visiting' }
OPXMIReferenceElement >> accept: aVisitor [
	aVisitor visitReferenceElement: self
]

{ #category : 'accessing' }
OPXMIReferenceElement >> href [
	^ href
]

{ #category : 'accessing' }
OPXMIReferenceElement >> href: anObject [
	href := anObject
]

{ #category : 'initialization' }
OPXMIReferenceElement >> initialize [
	super initialize.
	referencedElements := OrderedCollection new
]

{ #category : 'testing' }
OPXMIReferenceElement >> isReferenceElement [
	^ true
]

{ #category : 'accessing' }
OPXMIReferenceElement >> referencedElement [
	^ referencedElements ifEmpty: [ nil ] ifNotEmpty: [ referencedElements first ]
]

{ #category : 'accessing' }
OPXMIReferenceElement >> referencedElements [
	^ referencedElements
]

{ #category : 'accessing' }
OPXMIReferenceElement >> referencedElements: aCollection [
	referencedElements := aCollection
]

{ #category : 'accessing' }
OPXMIReferenceElement >> xmiType [
	^ xmiType
]

{ #category : 'accessing' }
OPXMIReferenceElement >> xmiType: anObject [
	xmiType := anObject
]
