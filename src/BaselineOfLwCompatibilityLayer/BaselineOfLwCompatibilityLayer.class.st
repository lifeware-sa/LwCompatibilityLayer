Class {
	#name : #BaselineOfLwCompatibilityLayer,
	#superclass : #BaselineOf,
	#category : #BaselineOfLwCompatibilityLayer
}

{ #category : #baselines }
BaselineOfLwCompatibilityLayer >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Lifeware-CompatibilityLayer-LwTestCase';
			package: 'Lifeware-CompatibilityLayer-PlatformSpecific';
			package: 'Lifeware-CompatibilityLayer-SystemInterface';
			package: 'Lifeware-CompatibilityLayer-Timestamp';
			package: 'Lifeware-CompatibilityLayer-XFilename';
			package: 'Lifeware-CompatibilityLayer-Transcript';
			package: 'Lifeware-CompatibilityLayer-PackedString';
			package: 'Lifeware-CompatibilityLayer-NByteArray';
			package: 'Lifeware-CompatibilityLayer-PersistentObject'.

		spec
			group: 'LwTestCase'
			with: #( 'Lifeware-CompatibilityLayer-LwTestCase' );
			group: 'NByteArray'
			with: #( 'Lifeware-CompatibilityLayer-NByteArray' );
			group: 'PackedString'
			with: #( 'Lifeware-CompatibilityLayer-PackedString' );
			group: 'Timestamp'
			with: #( 'Lifeware-CompatibilityLayer-Timestamp' );
			group: 'Transcript'
			with: #( 'Lifeware-CompatibilityLayer-Transcript' );
			group: 'XFilename'
			with: #( 'Lifeware-CompatibilityLayer-XFilename' );
			group: 'SystemInterface'
			with: #( 'Lifeware-CompatibilityLayer-SystemInterface' );
			group: 'PlatformSpecific'
			with: #( 'Lifeware-CompatibilityLayer-PlatformSpecific' );
			group: 'PersistentObject'
			with: #( 'Lifeware-CompatibilityLayer-PersistentObject' ) ]
]
