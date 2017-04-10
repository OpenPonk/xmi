tests
testReadWrite
    | in root out |
    in := '<?xml version="1.0" encoding="UTF-8"?>
<xmi:XMI>
	<container xmi:id="AA">
		<item xmi:id="BB">
			<reference xmi:idref="CC" />
		</item>
		<item xmi:id="CC">
			<body>Content</body>
		</item>
	</container>
</xmi:XMI>'.
    root := OPXMIReader from: in readStream.
    out := OPXMIWriter writeToString: root.
    self assert: (self normalized: in) equals: (self normalized: out)