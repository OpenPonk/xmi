visiting
visitDocument: aDocument
	self visit: aDocument root.
	self resolveAll.
	^ self elementAt: aDocument root