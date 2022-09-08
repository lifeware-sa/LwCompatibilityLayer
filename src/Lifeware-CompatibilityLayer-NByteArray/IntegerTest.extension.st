Extension { #name : #IntegerTest }

{ #category : #'*Lifeware-CompatibilityLayer-NByteArray' }
IntegerTest >> testAsFourByteArray [

	self
		assert: (256 * 2 + 1) asFourByteArray equals: #[ 0 0 2 1 ];
		assert: (Integer fromByteArray: #[ 0 0 2 1 ]) equals: 256 * 2 + 1
]
