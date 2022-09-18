Class {
	#name : #LwTestCase,
	#superclass : #TestCase,
	#category : #'Lifeware-CompatibilityLayer-LwTestCase'
}

{ #category : #asserting }
LwTestCase >> shouldRaiseError: aBlock description: aString [

	^ self
		  should: aBlock
		  raise: Error
		  whoseDescriptionIncludes: aString
		  description:
		  'Should raise error with description: ' , aString printString
]
