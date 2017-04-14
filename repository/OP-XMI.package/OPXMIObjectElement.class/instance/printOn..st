printing
printOn: aStream
	aStream
		<< 'XMIObjectElement(';
		<< xmiName.
	self xmiId
		ifNotNil: [ :id | 
			aStream
				<< ' xmi:id="';
				<< id;
				<< '"' ].
	self xmiType
		ifNotNil: [ :type | 
			aStream
				<< ' xmi:type="';
				<< type;
				<< '"' ].
	aStream << ')'