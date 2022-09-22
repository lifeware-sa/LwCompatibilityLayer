Class {
	#name : #XRandomTest,
	#superclass : #TestCase,
	#category : #'Lifeware-CompatibilityLayer-Random'
}

{ #category : #tests }
XRandomTest >> testInteger [

	self assert: ((XRandom new nextInt: 50) between: 1 and: 50)
]
