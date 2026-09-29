"
I represent an XMI XML element containing a scalar string value, strictly prohibiting nested elements or attributes.
"
Class {
	#name : 'OPXMIValueElement',
	#superclass : 'OPXMIElement',
	#instVars : [
		'value'
	],
	#category : 'OpenPonk-XMI-DOM',
	#package : 'OpenPonk-XMI',
	#tag : 'DOM'
}

{ #category : 'instance creation' }
OPXMIValueElement class >> xmiName: aName value: aValue [
	^ self new
		xmiName: aName;
		value: aValue;
		yourself
]

{ #category : 'visiting' }
OPXMIValueElement >> accept: aVisitor [
	aVisitor visitValueElement: self
]

{ #category : 'testing' }
OPXMIValueElement >> isValueElement [
	^ true
]

{ #category : 'evaluating' }
OPXMIValueElement >> value [
	^ value
]

{ #category : 'accessing' }
OPXMIValueElement >> value: aString [
	value := aString
]
