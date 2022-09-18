Class {
	#name : #XRandom,
	#superclass : #Object,
	#instVars : [
		'a',
		'm',
		'seed'
	],
	#category : #'Lifeware-CompatibilityLayer-Random'
}

{ #category : #initialization }
XRandom >> ___basicNext [
	^self getNext
]

{ #category : #initialization }
XRandom >> getNext [
	seed := self nextValue.
	^seed / m
]

{ #category : #initialization }
XRandom >> initialize [

	self seed: Time microsecondClockValue.
	a := 16r000041A7 asFloat. "magic constant = 0,000,016,807"
	m := 16r7FFFFFFF asFloat "magic constant = 2,147,483,647"
]

{ #category : #initialization }
XRandom >> next [
	^self ___basicNext
]

{ #category : #initialization }
XRandom >> nextInt: anInteger [
	"Answer a random integer in the interval [1, anInteger]."
	anInteger strictlyPositive ifFalse: [self error: 'Range must be positive'].
	^(self next * anInteger) truncated + 1
]

{ #category : #initialization }
XRandom >> nextValue [
	| product |
	product := a * seed.
	^product - (m * (product quo: m))
]

{ #category : #initialization }
XRandom >> seed: anInteger [ 
	seed := anInteger abs \\ 16r7FFFFFFF max: 1
]

{ #category : #initialization }
XRandom >> systemNext [
	^self ___basicNext
]
