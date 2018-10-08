Class {
	#name : #OPXMIReader,
	#superclass : #Object,
	#instVars : [
		'document'
	],
	#category : 'OP-XMI-Reader'
}

{ #category : #'instance creation' }
OPXMIReader class >> read: aStream mapping: aMapping [
	aMapping at: 'result' put: aStream contents.
	^ (self readFromMapping: aMapping) at: 'result'
]

{ #category : #'instance creation' }
OPXMIReader class >> readFrom: aStream [
	^ self new readFrom: aStream
]

{ #category : #'instance creation' }
OPXMIReader class >> readFromMapping: aMapping [
	"aMapping is a Dictionary of HREF URI -> XMI contents"

	^ self new readFromMapping: aMapping
]

{ #category : #'instance creation' }
OPXMIReader >> readFrom: aStream [
	| dom root |
	dom := XMLDOMParser parse: aStream readStream usingNamespaces: false.
	root := OPXMIReaderVisitor new visitDocument: dom.
	^ root
]

{ #category : #'instance creation' }
OPXMIReader >> readFromMapping: aMapping [
	| graphs |
	graphs := OrderedDictionary new.
	aMapping keysAndValuesDo: [ :key :value | graphs at: key put: (self readFrom: value) ].
	graphs valuesDo: [ :root | self resolveHrefsIn: root with: graphs ].
	^ graphs
]

{ #category : #'instance creation' }
OPXMIReader >> resolveHrefIn: aReferenceItem with: aMapping [
	| parts ref |
	aReferenceItem href ifNil: [ ^ self ].
	parts := aReferenceItem href splitOn: '#'.
	self flag: 'hack to circumvent package imports which are not properly resolved yet'.
	aMapping
		at: parts first
		ifPresent: [ :root | ref := root findElementWithXmiId: parts second ].
	(ref isNil
		and:
			[ aReferenceItem isReferenceElement and: [ aReferenceItem xmiType = 'uml:PrimitiveType' ] ])
		ifTrue: [ aMapping values
				detect: [ :root | (root findElementWithXmiId: parts second) isNotNil ]
				ifFound: [ :root | ref := root findElementWithXmiId: parts second ] ].
	"	ref ifNil: [ self error: 'Unable to resolve a reference.' ]."
	ref ifNotNil: [ aReferenceItem referencedElements: {ref} ]
]

{ #category : #'instance creation' }
OPXMIReader >> resolveHrefsIn: anElement with: aMapping [
	anElement isReferenceElement
		ifTrue: [ ^ self resolveHrefIn: anElement with: aMapping ].
	anElement isObjectElement
		ifFalse: [ ^ self ].
	anElement containedItems do: [ :each | self resolveHrefsIn: each with: aMapping ]
]
