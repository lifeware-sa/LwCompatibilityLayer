Extension { #name : #Object }

{ #category : #'*Lifeware-CompatibilityLayer-Transcript' }
Object >> transcript: aString [

	self xtranscript: aString
]

{ #category : #'*Lifeware-CompatibilityLayer-Transcript' }
Object >> xtranscript: aString [

	Transcript
		show: aString;
		cr
]
