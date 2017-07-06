factory
valueElementFor: aXMLElement
	^ OPXMIValueElement new
		xmiName: aXMLElement localName;
		value: (aXMLElement stringNodes ifEmpty: [ '' ] ifNotEmpty: [ :nodes | nodes first string ]);
		yourself