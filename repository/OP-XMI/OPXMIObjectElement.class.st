"
XMIObjectElement is an XML element that can contain other information items (XML elements and attributes).
"
Class {
	#name : #OPXMIObjectElement,
	#superclass : #OPXMIElement,
	#instVars : [
		'containedItems'
	],
	#category : 'OP-XMI-DOM'
}

{ #category : #visiting }
OPXMIObjectElement >> accept: aVisitor [
	aVisitor visitObjectElement: self
]

{ #category : #accessing }
OPXMIObjectElement >> containedItem [
	^ containedItems ifEmpty: [ ^ nil ] ifNotEmpty: #first
]

{ #category : #accessing }
OPXMIObjectElement >> containedItems [
	^ containedItems
]

{ #category : #accessing }
OPXMIObjectElement >> containedItems: aCollection [
	containedItems := aCollection
]

{ #category : #accessing }
OPXMIObjectElement >> elementNamed: aName [
	"return the first element with the given name"

	^ self containedItems
		detect: [ :each | each xmiName = aName ]
		ifFound: #yourself
		ifNone: [ nil ]
]

{ #category : #searching }
OPXMIObjectElement >> findElementWithXmiId: aXmiId [
	self xmiId = aXmiId
		ifTrue: [ ^ self ].
	self containedItems
		select: #isObjectElement
		thenDo: [ :each | (each findElementWithXmiId: aXmiId) ifNotNil: [ :match | ^ match ] ].
	^ nil
]

{ #category : #initialization }
OPXMIObjectElement >> initialize [
	super initialize.
	containedItems := OrderedCollection new
]

{ #category : #testing }
OPXMIObjectElement >> isObjectElement [
	^ true
]

{ #category : #'accessing - shortcuts' }
OPXMIObjectElement >> nameValue [
	"Retrieve the value of <name> child element. Throw up if none is present."

	^ (self containedItems detect: [ :each | each xmiName = #name ]) value
]

{ #category : #printing }
OPXMIObjectElement >> printOn: aStream [
	aStream
		<< 'XMIObjectElement(';
		<< xmiName.
	self xmiId
		ifNotNil: [ :id | 
			aStream
				<< ' xmi:id="';
				<< id;
				<< '"' ].
	self xmiType
		ifNotNil: [ :type | 
			aStream
				<< ' xmi:type="';
				<< type;
				<< '"' ].
	aStream << ')'
]

{ #category : #'accessing - shortcuts' }
OPXMIObjectElement >> xmiId [
	^ self containedItems
		detect: [ :each | each xmiName = #xmi:id ]
		ifFound: [ :each | each value ]
		ifNone: [ nil ]
]

{ #category : #'accessing - shortcuts' }
OPXMIObjectElement >> xmiType [
	^ self containedItems
		detect: [ :each | each xmiName = #xmi:type ]
		ifFound: [ :each | each value ]
		ifNone: [ nil ]
]
