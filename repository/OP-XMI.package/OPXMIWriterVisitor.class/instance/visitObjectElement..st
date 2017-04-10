visiting
visitObjectElement: anObjectElement
	"2a:XMIObjectElement ::= ( ""<"" 2k:QName 2d:XMIAttributes ""/>"" )
| ( ""<"" 2k:QName 2d:XMIAttributes "">""
(2:XMIElement)*
""</"" 2k:QName "">"" )"

"NOTE: I am not handling namespaces properly... thus I explicitly change XMI to xmi:XMI"

	writer
		tag:
			(anObjectElement xmiName = 'XMI'
				ifTrue: [ 'xmi:XMI' ]
				ifFalse: [ anObjectElement xmiName ])
		with: [ anObjectElement containedItems
				select: #isAttribute
				thenDo: [ :each | self visit: each ].
			anObjectElement containedItems select: #isElement thenDo: [ :each | self visit: each ] ]