GTInspector-Extensions
writeXMLOn: aWriter
	aWriter
		tag: self xmiName
		with: [ self referencedElements do: [ :each | each writeXMLOn: aWriter ] ]