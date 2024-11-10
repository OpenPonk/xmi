Class {
	#name : 'OPXMIReaderTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests',
	#package : 'OpenPonk-XMI',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
OPXMIReaderTest >> fileAAContents [
	^ '<container>
	<aaItem xmi:id="AAX">
		<bee href="BB.xmi#BBX" />
	</aaItem>
</container>'
]

{ #category : 'instance creation' }
OPXMIReaderTest >> fileBBContents [
	^ '<container>
	<bbItem xmi:id="BBX">
		<cee href="CC.xmi#CCX" />
	</bbItem>
</container>'
]

{ #category : 'instance creation' }
OPXMIReaderTest >> fileCCContents [
	^ '<container>
	<ccItem xmi:id="CCX" />
</container>'
]

{ #category : 'tests' }
OPXMIReaderTest >> testReadFromMapping [
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
]

{ #category : 'tests' }
OPXMIReaderTest >> testReadFromTypedMapping [
	| mapping result uml type |
	mapping := OrderedDictionary
		with: 'UML.xmi' -> self umlTypedElementContents
		with: 'PrimitiveTypes.xmi' -> self umlTypesContents.
	result := OPXMIReader readFromMapping: mapping.
	uml := (result at: 'UML.xmi') containedItems first.
	type := (result at: 'PrimitiveTypes.xmi') containedItems first.
	self assert: uml containedItems first referencedElement equals: type
]

{ #category : 'tests' }
OPXMIReaderTest >> testResolveHref [
	| reference map someFileXmi |
	reference := OPXMIReferenceElement new
		xmiName: 'reference';
		href: 'someFile.xmi#AAA'.
	someFileXmi := OPXMIObjectElement new
		xmiName: 'container';
		containedItems:
			{OPXMIObjectElement new
				xmiName: 'item';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'AAA'}}.
	map := Dictionary with: 'someFile.xmi' -> someFileXmi.
	OPXMIReader new resolveHrefIn: reference with: map.
	self assert: reference referencedElements size equals: 1.
	self assert: reference referencedElement equals: someFileXmi containedItem
]

{ #category : 'instance creation' }
OPXMIReaderTest >> umlTypedElementContents [
	^ '<wrap><ownedAttribute>
	<type xmi:type="uml:PrimitiveType" href="PrimitiveTypes.xmi#String" />
</ownedAttribute></wrap>'
]

{ #category : 'instance creation' }
OPXMIReaderTest >> umlTypesContents [
	^ '<uml:Package>
		<packagedElement xmi:type="uml:PrimitiveType" xmi:id="String" name="String" />
</uml:Package>'
]
