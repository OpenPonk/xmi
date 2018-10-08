Class {
	#name : #OPXMIInfoItems,
	#superclass : #Object,
	#category : 'OP-XMI-DOM'
}

{ #category : #testing }
OPXMIInfoItems class >> isAbstract [
	^ self = OPXMIInfoItems
]

{ #category : #testing }
OPXMIInfoItems >> isAttribute [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isElement [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isObjectElement [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isReferenceAttribute [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isReferenceElement [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isReferenceItem [
	^ self isReferenceAttribute | self isReferenceElement
]

{ #category : #testing }
OPXMIInfoItems >> isValueAttribute [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isValueElement [
	^ false
]

{ #category : #testing }
OPXMIInfoItems >> isValueItem [
	^ self isValueAttribute | self isValueElement
]
