"
XMIValueElement is an XML element that can have a value, but cannot contain other XML elements or attributes.
"
Class {
	#name : #OPXMIValueElement,
	#superclass : #OPXMIElement,
	#instVars : [
		'value'
	],
	#category : 'OP-XMI-DOM'
}

{ #category : #'instance creation' }
OPXMIValueElement class >> xmiName: aName value: aValue [
	^ self new
		xmiName: aName;
		value: aValue;
		yourself
]

{ #category : #visiting }
OPXMIValueElement >> accept: aVisitor [
	aVisitor visitValueElement: self
]

{ #category : #testing }
OPXMIValueElement >> isValueElement [
	^ true
]

{ #category : #accessing }
OPXMIValueElement >> value [
	^ value
]

{ #category : #accessing }
OPXMIValueElement >> value: aString [
	value := aString
]
