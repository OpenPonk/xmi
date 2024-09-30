Class {
	#name : 'OPXMIWriter',
	#superclass : 'Object',
	#category : 'OP-XMI-Writer',
	#package : 'OP-XMI',
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
