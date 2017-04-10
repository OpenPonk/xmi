printing
printOn: aStream
	aStream
		<< 'XMIReferenceAttribute(';
		<< xmiName;
		<< '")'