comparing
hash
	^ self species hash bitXor: (self xmiName hash bitXor: self value hash)