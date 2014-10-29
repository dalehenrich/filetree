versions
version1062: spec
	<version: '1.0.6.2' imports: #('1.0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '- bugfix for Issue #132: possible Squeak problem with FileTree caching
  https://github.com/dalehenrich/filetree/issues/132'.
		spec author: 'dkh'.
		spec timestamp: '10/29/2014 12:48'. ].

	spec for: #'pharo1.1.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo11-dkh.157';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14'. ].

	spec for: #'pharo1.2.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo11-dkh.157';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14'. ].

	spec for: #'pharo1.3.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo13-dkh.165';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo13-dkh.12'. ].

	spec for: #'pharo1.4.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo14-dkh.166';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo14-dkh.12'. ].

	spec for: #'pharo2.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo20-dkh.163';
			package: 'MonticelloFileTree-FileSystem-Utilities' with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-EstebanLorenzano.19';
			package: 'MonticelloFileTree-Git' with: 'MonticelloFileTree-Git.pharo20-dkh.63'. ].

	spec for: #'pharo3.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo30-dkh.159';
			package: 'MonticelloFileTree-FileSystem-Utilities' with: 'MonticelloFileTree-FileSystem-Utilities.pharo30-dkh.27'. ].

	spec for: #'squeak' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.squeak43-dkh.169';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.squeak43-dkh.12'. ].

	spec for: #'gemstone' do: [
		spec 
			project: 'GsCore' with: '0.246';
			project: 'Monticello' with: '0.243'.
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.164';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.gemstone24-dkh.14'. ].
