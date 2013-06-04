versions
version102: spec
	<version: '1.0.2' imports: #('1.0.2-baseline' )>

	spec for: #'pharo1.1.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo11-dkh.95';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14'. ].

	spec for: #'pharo1.2.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo11-dkh.95';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14'. ].

	spec for: #'pharo1.3.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo13-dkh.93';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo13-dkh.12'. ].

	spec for: #'pharo1.4.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo14-dkh.93';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.pharo14-dkh.12'. ].

	spec for: #'pharo2.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo20-dkh.91';
			package: 'MonticelloFileTree-FileSystem-Utilities' with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-dkh.17';
			package: 'MonticelloFileTree-Git' with: 'MonticelloFileTree-Git.pharo20-ThierryGoubier.12'. ].

	spec for: #'pharo3.x' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo30-dkh.91';
			package: 'MonticelloFileTree-FileSystem-Utilities' with: 'MonticelloFileTree-FileSystem-Utilities.pharo30-dkh.17'. ].

	spec for: #'squeak' do: [
		spec 
			package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.squeak43-dkh.92';
			package: 'MonticelloFileTree-FileDirectory-Utilities' with: 'MonticelloFileTree-FileDirectory-Utilities.squeak43-dkh.12'. ].

	spec for: #'gs3.1.0.x' do: [
		spec package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.99'. ].
