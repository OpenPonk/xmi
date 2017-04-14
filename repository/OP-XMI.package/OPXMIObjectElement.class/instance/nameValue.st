accessing - shortcuts
nameValue
	"Retrieve the value of <name> child element. Throw up if none is present."

	^ (self containedItems detect: [ :each | each xmiName = #name ]) value