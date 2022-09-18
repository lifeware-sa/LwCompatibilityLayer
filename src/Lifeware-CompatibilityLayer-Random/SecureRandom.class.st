Class {
	#name : #SecureRandom,
	#superclass : #Object,
	#category : #'Lifeware-CompatibilityLayer-Random'
}

{ #category : #accessing }
SecureRandom class >> nextInto: aByteArray [

	^ self new nextInto: aByteArray length: aByteArray size
]

{ #category : #accessing }
SecureRandom >> nextInto: aByteArray length: lengthInteger [

	| generator |
	generator := Random new.
	1 to: lengthInteger do: [ :index | 
	aByteArray at: index put: (generator nextInteger: 256) - 1 ].
	^ aByteArray
]
