accessing
elementNamed: aName
	"return the first element with the given name"

	^ self containedItems
		detect: [ :each | each xmiName = aName ]
		ifFound: #yourself
		ifNone: [ nil ]