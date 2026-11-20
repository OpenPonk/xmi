"
I am an integration test class verifying the bidirectional roundtrip (read and write) consistency of the XMI serialization infrastructure.
"
Class {
	#name : 'OPXMITest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests-Writer',
	#package : 'OpenPonk-XMI-Tests',
	#tag : 'Writer'
}

{ #category : 'tests' }
OPXMITest >> normalized: aString [
	^ (aString copyReplaceAll: String cr with: String lf)
		copyReplaceAll: String tab
		with: '    '
]

{ #category : 'tests' }
OPXMITest >> testPrettyPrintingFormatterLineBreakAndAtBeginning [

	| writer formatter expected |
	writer := XMLWriter new.
	formatter := OPXMLPrettyPrintingWriterFormatter new.
	writer formatter: formatter.
	formatter lineBreak: String crlf.
	formatter writeLineBreak.
	self assertEmpty: writer contents.
	writer tag: 'root' with: [ writer tag: 'child' ].
	expected := #( '<root>' '    <child/>' '</root>' ) joinUsing: String crlf.
	self assert: writer contents equals: expected
]

{ #category : 'tests' }
OPXMITest >> testReadWrite [
    | in root out |
    in := '<?xml version="1.0" encoding="UTF-8"?>
<xmi:XMI>
	<container xmi:id="AA">
		<item xmi:id="BB">
			<reference xmi:idref="CC"/>
		</item>
		<item xmi:id="CC">
			<body>Content</body>
		</item>
	</container>
</xmi:XMI>'.
    root := OPXMIReader readFrom: in readStream.
    out := OPXMIWriter toString: root.
    self assert: (self normalized: in) equals: (self normalized: out)
]

{ #category : 'tests' }
OPXMITest >> testReadWriteWithReferenceAttribute [

	| input root output |
	input := '<?xml version="1.0" encoding="UTF-8"?>
<xmi:XMI>
	<container xmi:id="AA">
		<item xmi:id="BB" target="CC"/>
		<item xmi:id="CC"/>
	</container>
</xmi:XMI>'.
	root := OPXMIReader readFrom: input readStream.
	output := OPXMIWriter toString: root.
	self assert: (self normalized: output) equals: (self normalized: input)
]

{ #category : 'tests' }
OPXMITest >> testWriteToStream [

	| root output |
	root := OPXMIObjectElement new xmiName: 'XMI'.
	output := String streamContents: [ :stream | OPXMIWriter write: root toStream: stream ].
	self assert: output equals: (OPXMIWriter toString: root)
]
