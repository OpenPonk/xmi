factory
valueElementFor: aXMLElement
	^ OPXMIValueElement new
		xmiName: aXMLElement localName;
		value: aXMLElement stringNodes first string;
		yourself