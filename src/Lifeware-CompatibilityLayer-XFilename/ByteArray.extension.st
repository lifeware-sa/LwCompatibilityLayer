Extension { #name : #ByteArray }

{ #category : #'*Lifeware-CompatibilityLayer-XFilename' }
ByteArray >> saveAs: aFilename [

	aFilename asXFilename putBinaryContents: self
]
