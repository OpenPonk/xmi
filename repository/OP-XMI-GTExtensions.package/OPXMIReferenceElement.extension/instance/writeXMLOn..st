*OP-XMI-GTExtensions
writeXMLOn: aWriter
	href
		ifNil: [ aWriter tag: self xmiName ]
		ifNotNil: [ aWriter tag: self xmiName attributes: {#href -> href} ]