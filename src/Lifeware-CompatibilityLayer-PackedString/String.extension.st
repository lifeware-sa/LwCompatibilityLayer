Extension { #name : #String }

{ #category : #'*Lifeware-CompatibilityLayer-PackedString' }
String >> fromPrintableString [

	^ ByteArray fromPackedString: self
]
