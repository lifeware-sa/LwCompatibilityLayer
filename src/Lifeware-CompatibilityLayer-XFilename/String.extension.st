Extension { #name : #String }

{ #category : #'*Lifeware-CompatibilityLayer-XFilename' }
String >> asXFilename [

	^ XFilename named: self
]

{ #category : #'*Lifeware-CompatibilityLayer-XFilename' }
String >> saveAs: aFilename [

	aFilename asXFilename putBinaryContents: self
]
