tests
testNoSelfReference
	"<packagedElement xmi:type=""uml:Package"" xmi:id=""Classification"" name=""Classification"">
the name attribute should be ValueAttribute because it refers to itself"

	| element |
	element := self
		elementNamed: 'packagedElement'
		attributes:
			{#xmi:type -> 'uml:Package'.
			#xmi:id -> 'Classification'.
			#name -> 'Classification'}.
	visitor visitElement: element.
	result := visitor elementAt: element.
	self assert: result containedItems last isValueAttribute.
	visitor resolveAll.
	self assert: result containedItems last isValueAttribute