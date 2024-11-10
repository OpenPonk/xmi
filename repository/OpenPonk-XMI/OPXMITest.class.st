Class {
	#name : 'OPXMITest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMI-Tests',
	#package : 'OpenPonk-XMI',
	#tag : 'Tests'
}

{ #category : 'tests' }
OPXMITest >> normalized: aString [
	^ (aString copyReplaceAll: String cr with: String lf)
		copyReplaceAll: String tab
		with: '    '
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
