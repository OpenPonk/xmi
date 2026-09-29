"
I extend the standard XML pretty printing formatter to provide explicit control over the line break character sequences used during XML generation.
"
Class {
	#name : 'OPXMLPrettyPrintingWriterFormatter',
	#superclass : 'XMLPrettyPrintingWriterFormatter',
	#instVars : [
		'lineBreak'
	],
	#category : 'OpenPonk-XMI-Writer',
	#package : 'OpenPonk-XMI',
	#tag : 'Writer'
}

{ #category : 'writing' }
OPXMLPrettyPrintingWriterFormatter >> lineBreak: aCharacterOrString [
	lineBreak := aCharacterOrString asString
]

{ #category : 'writing' }
OPXMLPrettyPrintingWriterFormatter >> writeLineBreak [

	self writer atBeginning ifTrue: [ ^ self ].
	self writer nextPutAll: lineBreak.
	self currentIndentLevel > 0 ifTrue: [
		self indentString ifNotEmpty: [ self writeIndent ] ]
]

{ #category : 'accessing' }
OPXMLPrettyPrintingWriterFormatter >> writer: aWriter [
	super writer: aWriter.
	lineBreak ifNil: [ lineBreak := aWriter lineBreak ]
]
