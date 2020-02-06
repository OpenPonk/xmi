Class {
	#name : #OPXMIReaderVisitor,
	#superclass : #XMLDOMVisitor,
	#instVars : [
		'document',
		'root',
		'mapping',
		'unresolved',
		'refIdMapping'
	],
	#category : 'OP-XMI-Reader'
}

{ #category : #factory }
OPXMIReaderVisitor >> attributeFor: aXMLAttribute [
	(self isReferenceAttribute: aXMLAttribute)
		ifTrue: [ ^ self referenceAttributeFor: aXMLAttribute ].
	^ self valueAttributeFor: aXMLAttribute
]

{ #category : #accessing }
OPXMIReaderVisitor >> elementAt: aXMLElement [
	^ mapping at: aXMLElement
]

{ #category : #factory }
OPXMIReaderVisitor >> elementFor: aXMLElement [
	(self isValueElement: aXMLElement)
		ifTrue: [ ^ self valueElementFor: aXMLElement ].
	(self isReferenceElement: aXMLElement)
		ifTrue: [ ^ self referenceElementFor: aXMLElement ].
	^ self objectElementFor: aXMLElement
]

{ #category : #initialization }
OPXMIReaderVisitor >> initialize [
	super initialize.
	mapping := Dictionary new.
	refIdMapping := Dictionary new.
	unresolved := OrderedCollection new
]

{ #category : #factory }
OPXMIReaderVisitor >> isReferenceAttribute: aXMLAttribute [
	(aXMLAttribute parent isNotNil
		and: [ aXMLAttribute value = (self elementAt: aXMLAttribute parent) xmiId ])
		ifTrue: [ ^ false ].
	aXMLAttribute prefix = 'xmi'
		ifTrue: [ ^ false ].
	^ (aXMLAttribute value splitOn: ' ')
		allSatisfy: [ :each | refIdMapping includesKey: each ]
]

{ #category : #testing }
OPXMIReaderVisitor >> isReferenceElement: aXMLElement [
	| names |
	aXMLElement hasAttributes not | aXMLElement hasElements
		ifTrue: [ ^ false ].
	names := aXMLElement attributeNodes collect: #name.
	^ names allSatisfy: [ :each | #('xmi:idref' 'href' 'xmi:type') includes: each ]
]

{ #category : #testing }
OPXMIReaderVisitor >> isValueElement: aXMLElement [
	aXMLElement hasAttributes
		ifTrue: [ ^ false ].
	aXMLElement nodes size = 0
		ifTrue: [ ^ true ].
	^ aXMLElement nodes size = 1 and: [ aXMLElement nodes first isStringNode ]
]

{ #category : #factory }
OPXMIReaderVisitor >> objectElementFor: aXMLElement [
	| element |
	element := OPXMIObjectElement new
		xmiName: aXMLElement localName;
		yourself.
	element
		containedItems:
			(aXMLElement attributeNodes collect: [ :attr | self valueAttributeFor: attr ])
				asOrderedCollection.
	unresolved
		add: [ element
				containedItems:
					(aXMLElement attributeNodes collect: [ :attr | self attributeFor: attr ])
						asOrderedCollection, (element containedItems select: #isElement) ].
	^ element
]

{ #category : #factory }
OPXMIReaderVisitor >> referenceAttributeFor: aXMLAttribute [
	^ OPXMIReferenceAttribute new
		xmiName: aXMLAttribute name;
		referencedElements: ((aXMLAttribute value splitOn: ' ') collect: [ :each | refIdMapping at: each ]);
		yourself
]

{ #category : #factory }
OPXMIReaderVisitor >> referenceElementFor: aXMLElement [
	| el attribute |
	(el := OPXMIReferenceElement new) xmiName: aXMLElement localName.
	attribute := aXMLElement attributeNodes
		detect: [ :each | each name = 'href' | (each name = 'xmi:idref') ].
	attribute name = 'href'
		ifTrue: [ el href: attribute value ]
		ifFalse: [ unresolved add: [ el referencedElements: {refIdMapping at: attribute value} ] ].
	aXMLElement attributeNodes
		detect: [ :each | each name = 'xmi:type' ]
		ifFound: [ :typeAttrib | el xmiType: typeAttrib value ].
	^ el
]

{ #category : #actions }
OPXMIReaderVisitor >> resolveAll [
	unresolved do: #value
]

{ #category : #factory }
OPXMIReaderVisitor >> valueAttributeFor: aXMLAttribute [
	^ OPXMIValueAttribute new
		xmiName: aXMLAttribute name;
		value: aXMLAttribute value;
		yourself
]

{ #category : #factory }
OPXMIReaderVisitor >> valueElementFor: aXMLElement [
	^ OPXMIValueElement new
		xmiName: aXMLElement localName;
		value: (aXMLElement stringNodes ifEmpty: [ '' ] ifNotEmpty: [ :nodes | nodes first string ]);
		yourself
]

{ #category : #visiting }
OPXMIReaderVisitor >> visitDocument: aDocument [
	self visit: aDocument root.
	self resolveAll.
	^ self elementAt: aDocument root
]

{ #category : #visiting }
OPXMIReaderVisitor >> visitElement: aXMLElement [
	| element |
	element := self elementFor: aXMLElement.
	mapping at: aXMLElement put: element.
	mapping at: aXMLElement parent ifPresent: [ :parent | parent containedItems add: element ].
	element isObjectElement
		ifTrue: [ refIdMapping at: element xmiId put: element ].
	super visitElement: aXMLElement
]
