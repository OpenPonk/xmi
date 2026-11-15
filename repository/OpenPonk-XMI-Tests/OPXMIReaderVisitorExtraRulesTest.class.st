"
I am a unit test class verifying edge cases and specific validation rules (such as rejecting self-references) within OPXMIReaderVisitor.
"
Class {
	#name : 'OPXMIReaderVisitorExtraRulesTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor',
		'result'
	],
	#category : 'OpenPonk-XMI-Tests-Reader',
	#package : 'OpenPonk-XMI-Tests',
	#tag : 'Reader'
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
	element := self elementNamed: 'packagedElement' attributes: {
			           (#'xmi:type' -> 'uml:Package').
			           (#'xmi:id' -> 'Classification').
			           (#name -> 'Classification') }.
	visitor visitElement: element.
	result := visitor elementAt: element.
	self assert: result containedItems last class identicalTo: OPXMIValueAttribute.
	self assert: result containedItems last xmiName equals: 'name'.
	self assert: result containedItems last value equals: 'Classification'.
	visitor resolveAll.
	self assert: result containedItems last class identicalTo: OPXMIValueAttribute.
	self assert: result containedItems last xmiName equals: 'name'.
	self assert: result containedItems last value equals: 'Classification'
]

{ #category : 'tests' }
OPXMIReaderVisitorExtraRulesTest >> testNoSelfReferenceIsReferenceAttributeNot [
	"goes with testNoSelfReference"

	| element |
	element := self elementNamed: 'whatever' attributes: {
			           (#'xmi:id' -> 'NAME').
			           (#name -> 'NAME') }.
	self
		deny: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'NAME'))
		description: 'Attribute whose value does not match any registered xmi:id must not be a reference attribute'.
	visitor visitElement: element.
	self
		assert: (visitor isReferenceAttribute: (XMLAttribute name: 'name' value: 'NAME'))
		description: 'Detached attribute matching a registered xmi:id must be treated as a reference attribute'.
	self
		deny: (visitor isReferenceAttribute: (element attributeNodeAt: 'name'))
		description: 'Attribute whose value matches its own parent element xmi:id must not be treated as a self-reference'
]
