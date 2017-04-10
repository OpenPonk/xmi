instance creation
fromUrl: aUrl
	^ self from: (ZnEasy get: aUrl) entity readStream contents