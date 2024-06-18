Class {
	#name : 'OPXMIWriterVisitor',
	#superclass : 'Object',
	#instVars : [
		'writer'
	],
	#category : 'OP-XMI-Writer',
	#package : 'OP-XMI',
	#tag : 'Writer'
}

{ #category : 'accessing' }
OPXMIWriterVisitor >> contents [
	^ writer contents
]

{ #category : 'initialization' }
OPXMIWriterVisitor >> initialize [
	super initialize.
	writer := XMLWriter new.
	writer formatter: OPXMLPrettyPrintingWriterFormatter new.
	writer lineBreak: '&#10;'.
	writer xml encoding: 'UTF-8'
]

{ #category : 'visiting' }
OPXMIWriterVisitor >> visit: anElement [
	anElement accept: self
]

{ #category : 'visiting' }
OPXMIWriterVisitor >> visitObjectElement: anObjectElement [
	"2a:XMIObjectElement ::= ( ""<"" 2k:QName 2d:XMIAttributes ""/>"" )
| ( ""<"" 2k:QName 2d:XMIAttributes "">""
(2:XMIElement)*
""</"" 2k:QName "">"" )"

"NOTE: I am not handling namespaces properly... thus I explicitly change XMI to xmi:XMI"

	writer
		tag:
			(anObjectElement xmiName = 'XMI'
				ifTrue: [ 'xmi:XMI' ]
				ifFalse: [ anObjectElement xmiName ])
		with: [ anObjectElement containedItems
				select: #isAttribute
				thenDo: [ :each | self visit: each ].
			anObjectElement containedItems select: #isElement thenDo: [ :each | self visit: each ] ]
]

{ #category : 'visiting' }
OPXMIWriterVisitor >> visitReferenceAttribute: aReferenceAttribute [
	"2j:XMIReferenceAttribute ::= //xmiName// ""=’"" ( //refId// )+ ""’"

	writer writeAttributeName: aReferenceAttribute xmiName value: ((aReferenceAttribute referencedElements collect: #xmiId) joinUsing: ' ')
]

{ #category : 'visiting' }
OPXMIWriterVisitor >> visitReferenceElement: aReferenceElement [
	"
2c:XMIReferenceElement::= ""<"" //xmiName// 2l:LinkAttribs ""/>""
2l:LinkAttribs ::= ""xmi:idref=’"" //refId// ""’"" | 2m:Link
2m:Link ::= ""href='"" 2n:URIref ""'""
2n:URIref ::= (2k:QName)? //URI reference//

Additionally every modeling tool adds xmi:type information, even though the specs do not seem to allow it.
"

	writer
		tag: aReferenceElement xmiName
		with: [ aReferenceElement xmiType
				ifNotNil: [ writer writeAttributeName: #xmi:type value: aReferenceElement xmiType ].
			aReferenceElement href
				ifNil:
					[ "idref" writer writeAttributeName: #xmi:idref value: aReferenceElement referencedElement xmiId ]
				ifNotNil: [ "href" writer writeAttributeName: 'href' value: aReferenceElement href ] ]
]

{ #category : 'visiting' }
OPXMIWriterVisitor >> visitValueAttribute: aValueAttribute [
	"2i:XMIValueAttribute ::= //xmiName// ""=’"" value ""’"""

	writer writeAttributeName: aValueAttribute xmiName value: aValueAttribute value
]

{ #category : 'visiting' }
OPXMIWriterVisitor >> visitValueElement: aValueElement [
	"2b:XMIValueElement ::= ( ""<"" //xmiName// "">"" //value//
""</"" //xmiName// "">"" )
| ( ""<xsi:nil='true'/>"" )"

	"xsi:nil shouldBeImplement"

	writer tag: aValueElement xmiName with: aValueElement value
]

{ #category : 'accessing' }
OPXMIWriterVisitor >> writer [
	^ writer
]
