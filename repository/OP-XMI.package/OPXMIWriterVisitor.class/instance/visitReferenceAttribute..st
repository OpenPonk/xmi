visiting
visitReferenceAttribute: aReferenceAttribute
	"2j:XMIReferenceAttribute ::= //xmiName// ""=’"" ( //refId// )+ ""’"

	writer writeAttributeName: aReferenceAttribute xmiName value: ((aReferenceAttribute referencedElements collect: #xmiId) joinUsing: ' ')