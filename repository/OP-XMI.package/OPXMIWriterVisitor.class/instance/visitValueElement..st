visiting
visitValueElement: aValueElement
	"2b:XMIValueElement ::= ( ""<"" //xmiName// "">"" //value//
""</"" //xmiName// "">"" )
| ( ""<xsi:nil='true'/>"" )"

	"xsi:nil shouldBeImplement"

	writer tag: aValueElement xmiName with: aValueElement value