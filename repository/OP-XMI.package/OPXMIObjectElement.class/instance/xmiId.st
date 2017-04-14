accessing - shortcuts
xmiId
	^ self containedItems
		detect: [ :each | each xmiName = #xmi:id ]
		ifFound: [ :each | each value ]
		ifNone: [ nil ]