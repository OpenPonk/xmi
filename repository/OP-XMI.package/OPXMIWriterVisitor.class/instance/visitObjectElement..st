visiting
visitObjectElement: anObjectElement
	"2a:XMIObjectElement ::= ( ""<"" 2k:QName 2d:XMIAttributes ""/>"" )
| ( ""<"" 2k:QName 2d:XMIAttributes "">""
(2:XMIElement)*
""</"" 2k:QName "">"" )"

	writer
		tag: anObjectElement xmiName
		with: [ anObjectElement containedItems select: #isAttribute thenDo: [ :each | self visit: each ].
			anObjectElement containedItems select: #isElement thenDo: [ :each | self visit: each ] ]