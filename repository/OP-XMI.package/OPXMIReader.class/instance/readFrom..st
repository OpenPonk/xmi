instance creation
readFrom: aStream
	| dom root |
	dom := XMLDOMParser parse: aStream usingNamespaces: false.
	root := OPXMIReaderVisitor new visitDocument: dom.
	^ root