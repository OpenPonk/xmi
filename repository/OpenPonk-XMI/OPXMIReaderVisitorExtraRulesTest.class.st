Class {
	#name : 'OPXMIReaderVisitorExtraRulesTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor',
		'result'
	],
	#category : 'OpenPonk-XMI-Tests',
	#package : 'OpenPonk-XMI',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
OPXMIReaderVisitorExtraRulesTest >> elementNamed: aName [
	^ XMLElement named: aName
]

{ #category : 'instance creation' }
OPXMIReaderVisitorExtraRulesTest >> elementNamed: aName attributes: aCollection [
	^ (XMLElement named: aName)
		usesNamespaces: false;
		setAttributes: aCollection;
		yourself
]

{ #category : 'running' }
OPXMIReaderVisitorExtraRulesTest >> setUp [
	super setUp.
	visitor := OPXMIReaderVisitor new
]

{ #category : 'tests' }
OPXMIReaderVisitorExtraRulesTest >> testNoSelfReference [
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
]

{ #category : 'tests' }
OPXMIReaderVisitorExtraRulesTest >> testNoSelfReferenceIsReferenceAttributeNot [
	"goes with testNoSelfReference"

	| element |
	element := self
		elementNamed: 'whatever'
		attributes:
			{#xmi:id -> 'NAME'.
			#name -> 'NAME'}.
	self deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'NAME')).
	visitor visitElement: element.
	self assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'NAME')).
	self deny: (visitor isReferenceAttribute: (element attributeNodeAt: 'name'))
]
