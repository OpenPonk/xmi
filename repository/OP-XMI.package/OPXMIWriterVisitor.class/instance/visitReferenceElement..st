visiting
visitReferenceElement: aReferenceElement
	"
2c:XMIReferenceElement::= ""<"" //xmiName// 2l:LinkAttribs ""/>""
2l:LinkAttribs ::= ""xmi:idref=’"" //refId// ""’"" | 2m:Link
2m:Link ::= ""href='"" 2n:URIref ""'""
2n:URIref ::= (2k:QName)? //URI reference//

Additionally every modeling tool adds xmi:type information, even though the specs do not seem to allow it.
"

	writer
		tag: aReferenceElement xmiName
		with: [ aReferenceElement xmiType
				ifNotNil: [ writer writeAttributeName: #xmi:type value: aReferenceElement xmiType ].
			aReferenceElement href
				ifNil:
					[ "idref" writer writeAttributeName: #xmi:idref value: aReferenceElement referencedElement xmiId ]
				ifNotNil: [ "href" writer writeAttributeName: 'href' value: aReferenceElement href ] ]