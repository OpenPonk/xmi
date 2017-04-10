writing
write: anXMI to: aStream
	| visitor |
	visitor := OPXMIWriterVisitor new.
	visitor visit: anXMI.
	aStream << visitor contents