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
			package: 'Lifeware-CompatibilityLayer-Random';
			package: 'Lifeware-CompatibilityLayer-NByteArray'.

		spec
			group: 'LwTestCase'
			with: #( 'Lifeware-CompatibilityLayer-LwTestCase' );
			group: 'Random'
			with: #( 'Lifeware-CompatibilityLayer-Random' );
			group: 'NByteArray'
			with: #( 'Lifeware-CompatibilityLayer-NByteArray' );
			group: 'Timestamp'
			with: #( 'Lifeware-CompatibilityLayer-Timestamp' );
			group: 'Transcript'
			with: #( 'Lifeware-CompatibilityLayer-Transcript' );
			group: 'XFilename'
			with: #( 'Lifeware-CompatibilityLayer-XFilename' );
			group: 'SystemInterface'
			with: #( 'Lifeware-CompatibilityLayer-SystemInterface' );
			group: 'PlatformSpecific'
			with: #( 'Lifeware-CompatibilityLayer-PlatformSpecific' ) ]
]
