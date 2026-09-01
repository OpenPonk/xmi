"
I am the abstract base class for all XMI information items (elements and attributes) representing the parsed structure of an XMI document.
"
Class {
	#name : 'OPXMIInfoItems',
	#superclass : 'Object',
	#category : 'OpenPonk-XMI-DOM',
	#package : 'OpenPonk-XMI',
	#tag : 'DOM'
}

{ #category : 'testing' }
OPXMIInfoItems class >> isAbstract [
	^ self = OPXMIInfoItems
]

{ #category : 'testing' }
OPXMIInfoItems >> isAttribute [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isElement [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isObjectElement [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isReferenceAttribute [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isReferenceElement [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isReferenceItem [
	^ self isReferenceAttribute | self isReferenceElement
]

{ #category : 'testing' }
OPXMIInfoItems >> isValueAttribute [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isValueElement [
	^ false
]

{ #category : 'testing' }
OPXMIInfoItems >> isValueItem [
	^ self isValueAttribute | self isValueElement
]
