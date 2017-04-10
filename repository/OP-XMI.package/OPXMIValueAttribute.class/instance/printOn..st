printing
printOn: aStream
	aStream
		<< 'XMIValueAttribute(';
		<< xmiName;
		<< '="';
		<< value;
		<< '")'