Class {
	#name : #OPXMLPrettyPrintingWriterFormatter,
	#superclass : #XMLPrettyPrintingWriterFormatter,
	#instVars : [
		'lineBreak'
	],
	#category : #'OP-XMI-Writer'
}

{ #category : #writing }
OPXMLPrettyPrintingWriterFormatter >> lineBreak: aCharacterOrString [
	lineBreak := aCharacterOrString asString
]

{ #category : #writing }
OPXMLPrettyPrintingWriterFormatter >> writeLineBreak [
	self writer atBeginning
		ifFalse: [ self writer nextPutAll: lineBreak.
			(self currentIndentLevel > 0 and: [ self indentString size > 0 ])
				ifTrue: [ self writeIndent ] ]
]

{ #category : #writing }
OPXMLPrettyPrintingWriterFormatter >> writer: aWriter [
	super writer: aWriter.
	lineBreak ifNil: [ lineBreak := aWriter lineBreak ]
]
