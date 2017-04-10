factory
referenceAttributeFor: aXMLAttribute
	^ OPXMIReferenceAttribute new
		xmiName: aXMLAttribute name;
		referencedElements: ((aXMLAttribute value splitOn: ' ') collect: [ :each | refIdMapping at: each ]);
		yourself