accessing
xmiType
	^ self containedItems
		detect: [ :each | each xmiName = #xmi:type ]
		ifFound: [ :each | each value ]
		ifNone: [ nil ]