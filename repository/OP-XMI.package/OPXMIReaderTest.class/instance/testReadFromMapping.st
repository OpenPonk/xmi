tests
testReadFromMapping
	| mapping result aaItem bbItem ccItem |
	"ordered to have both forward (B->C) and backward (B<-A) lookup"
	mapping := OrderedDictionary
		with: 'BB.xmi' -> self fileBBContents
		with: 'AA.xmi' -> self fileAAContents
		with: 'CC.xmi' -> self fileCCContents.
	result := OPXMIReader readFromMapping: mapping.
	aaItem := (result at: 'AA.xmi') containedItems first.
	bbItem := (result at: 'BB.xmi') containedItems first.
	ccItem := (result at: 'CC.xmi') containedItems first.
	self assert: aaItem containedItems second referencedElement equals: bbItem.
	self assert: bbItem containedItems second referencedElement equals: ccItem