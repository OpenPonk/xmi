"
I am the main entry point for serializing an object-oriented hierarchy of XMI information items into an XMI-formatted string or stream.
"
Class {
	#name : 'OPXMIWriter',
	#superclass : 'Object',
	#category : 'OpenPonk-XMI-Writer',
	#package : 'OpenPonk-XMI',
	#tag : 'Writer'
}

{ #category : 'writing' }
OPXMIWriter class >> toString: anXMI [

	| visitor |
	visitor := OPXMIWriterVisitor new.
	visitor visit: anXMI.
	^ visitor contents
]

{ #category : 'writing' }
OPXMIWriter class >> write: anXMI toStream: aStream [

	aStream << (self toString: anXMI)
]
