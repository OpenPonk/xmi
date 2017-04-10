tests
normalized: aString
	^ (aString copyReplaceAll: String cr with: String lf)
		copyReplaceAll: String tab
		with: '    '