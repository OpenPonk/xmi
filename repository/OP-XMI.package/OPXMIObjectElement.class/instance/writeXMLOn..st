GTInspector-Extensions
writeXMLOn: aWriter
	aWriter
		tag: self xmiName
		attributes:
			({#xmi:id -> self xmiId.
			#xmi:type -> self xmiType} select: [:pair | pair value isNotNil])