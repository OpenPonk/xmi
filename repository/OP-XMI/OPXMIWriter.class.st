Class {
	#name : #OPXMIWriter,
	#superclass : #Object,
	#category : 'OP-XMI-Writer'
}

{ #category : #writing }
OPXMIWriter class >> write: anXMI to: aStream [
	^ self new write: anXMI to: aStream
]

{ #category : #writing }
OPXMIWriter class >> writeToString: anXMI [
	^ String streamContents: [ :stream | self write: anXMI to: stream ]
]

{ #category : #writing }
OPXMIWriter >> write: anXMI to: aStream [
	| visitor |
	visitor := OPXMIWriterVisitor new.
	visitor visit: anXMI.
	aStream << visitor contents
]
