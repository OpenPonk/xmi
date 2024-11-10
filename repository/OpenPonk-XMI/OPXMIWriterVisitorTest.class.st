Class {
	#name : 'OPXMIWriterVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'OpenPonk-XMI-Tests',
	#package : 'OpenPonk-XMI',
	#tag : 'Tests'
}

{ #category : 'running' }
OPXMIWriterVisitorTest >> setUp [
	super setUp.
	visitor := OPXMIWriterVisitor new
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitObjectElement [
	visitor
		visitObjectElement:
			(OPXMIObjectElement new
				xmiName: 'Object';
				containedItems:
					{OPXMIValueAttribute new
						xmiName: 'xmi:id';
						value: 'ID'.
					OPXMIValueElement new
						xmiName: 'body';
						value: 'CONTENT'}).
	self
		assert: visitor contents
		equals:
			'<?xml version="1.0" encoding="UTF-8"?>
<Object xmi:id="ID">
    <body>CONTENT</body>
</Object>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitReferenceAttribute [
	visitor writer
		tag: 'outer'
		with: [ visitor
				visitReferenceAttribute:
					(OPXMIReferenceAttribute new
						xmiName: 'key';
						referencedElements:
							{OPXMIObjectElement new
								xmiName: 'whatever';
								containedItems:
									{OPXMIValueAttribute new
										xmiName: 'xmi:id';
										value: 'AAA'}}) ].
	self assert: visitor contents lines last equals: '<outer key="AAA"/>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitReferenceElement [
	visitor
		visitReferenceElement:
			(OPXMIReferenceElement new
				xmiName: 'name';
				referencedElements:
					{OPXMIObjectElement new
						xmiName: 'whatever';
						containedItems:
							{OPXMIValueElement new
								xmiName: 'xmi:id';
								value: 'AAA'}}).
	self assert: visitor contents lines last equals: '<name xmi:idref="AAA"/>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitReferenceElementHref [
	visitor
		visitReferenceElement:
			(OPXMIReferenceElement new
				xmiName: 'name';
				href: 'http://UNIVERSE').
	self assert: visitor contents lines last equals: '<name href="http://UNIVERSE"/>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitReferenceElementHrefType [
	visitor
		visitReferenceElement:
			(OPXMIReferenceElement new
				xmiName: 'name';
				xmiType: 'uml:PrimitiveType';
				href: 'http://UNIVERSE').
	self
		assert: visitor contents lines last
		equals: '<name xmi:type="uml:PrimitiveType" href="http://UNIVERSE"/>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitValueAttribute [
	visitor writer
		tag: 'outer'
		with: [ visitor
				visitValueAttribute:
					(OPXMIValueAttribute new
						xmiName: 'key';
						value: 'VALUE') ].
	self assert: visitor contents lines last equals: '<outer key="VALUE"/>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitValueElement [
	visitor visitValueElement: (OPXMIValueElement new xmiName: 'name'; value: 'VALUE').
	self assert: visitor contents lines last equals: '<name>VALUE</name>'
]

{ #category : 'tests' }
OPXMIWriterVisitorTest >> testVisitXmiElement [
	visitor visitObjectElement: (OPXMIObjectElement new xmiName: 'XMI').
	self
		assert: visitor contents
		equals:
			'<?xml version="1.0" encoding="UTF-8"?>
<xmi:XMI/>'
]
