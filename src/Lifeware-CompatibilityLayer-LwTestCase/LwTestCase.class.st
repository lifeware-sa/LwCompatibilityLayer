Class {
	#name : #LwTestCase,
	#superclass : #TestCase,
	#category : #'Lifeware-CompatibilityLayer-LwTestCase'
}

{ #category : #testing }
LwTestCase class >> isAbstract [
	"The default Lifeware tester's rule is that only leaf classes are concrete and should have tests built from them.  Override whenever this rule does not give the correct results."

	^self == LwTestCase or:
		[self subclasses notEmpty]
]

{ #category : #asserting }
LwTestCase >> shouldRaiseError: aBlock description: aString [

	^ self
		  should: aBlock
		  raise: Error
		  whoseDescriptionIncludes: aString
		  description:
		  'Should raise error with description: ' , aString printString
]
