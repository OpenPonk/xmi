"
XMIValueAttribute is simply an XML attribute with a value.
"
Class {
	#name : 'OPXMIValueAttribute',
	#superclass : 'OPXMIAttribute',
	#instVars : [
		'value'
	],
	#category : 'OpenPonk-XMI-DOM',
	#package : 'OpenPonk-XMI',
	#tag : 'DOM'
}

{ #category : 'instance creation' }
OPXMIValueAttribute class >> xmiName: aName value: aValue [
	^ self new
		xmiName: aName;
		value: aValue;
		yourself
]

{ #category : 'comparing' }
OPXMIValueAttribute >> = aValueAttribute [
	self species = aValueAttribute species
		ifFalse: [ ^ false ].
	self xmiName = aValueAttribute xmiName
		ifFalse: [ ^ false ].
	self value = aValueAttribute value
		ifFalse: [ ^ false ].
	^ true
]

{ #category : 'visiting' }
OPXMIValueAttribute >> accept: aVisitor [
	aVisitor visitValueAttribute: self
]

{ #category : 'comparing' }
OPXMIValueAttribute >> hash [
	^ self species hash bitXor: (self xmiName hash bitXor: self value hash)
]

{ #category : 'testing' }
OPXMIValueAttribute >> isValueAttribute [
	^ true
]

{ #category : 'printing' }
OPXMIValueAttribute >> printOn: aStream [
	aStream
		<< 'XMIValueAttribute(';
		<< xmiName;
		<< '="';
		<< value;
		<< '")'
]

{ #category : 'accessing' }
OPXMIValueAttribute >> value [
	^ value
]

{ #category : 'accessing' }
OPXMIValueAttribute >> value: aString [
	value := aString
]
