instance creation
readFrom: aStream
	| dom root |
	dom := XMLDOMParser parse: aStream readStream usingNamespaces: false.
	root := OPXMIReaderVisitor new visitDocument: dom.
	^ root