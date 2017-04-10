factory
valueAttributeFor: aXMLAttribute
	^ OPXMIValueAttribute new
		xmiName: aXMLAttribute name;
		value: aXMLAttribute value;
		yourself