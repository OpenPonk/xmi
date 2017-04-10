instance creation
elementNamed: aName attributes: aCollection
	^ (XMLElement named: aName)
		usesNamespaces: false;
		setAttributes: aCollection;
		yourself