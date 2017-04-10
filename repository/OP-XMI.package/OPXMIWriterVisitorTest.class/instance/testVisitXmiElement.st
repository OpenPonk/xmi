tests
testVisitXmiElement
	visitor visitObjectElement: (OPXMIObjectElement new xmiName: 'XMI').
	self
		assert: visitor contents
		equals:
			'<?xml version="1.0" encoding="UTF-8"?>
<xmi:XMI />'