versions
version102: spec
    <version: '1.0.2' imports: #('1.0-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: ''.
            spec author: 'dkh'.
            spec timestamp: '3/12/2013 16:30' ].
    spec
        for: #'pharo1.1.x'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo11-dkh.95';
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14'  ].
    spec
        for: #'pharo1.2.x'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo11-dkh.95';
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14'  ].
    spec
        for: #'pharo1.3.x'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo13-dkh.93';
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: 'MonticelloFileTree-FileDirectory-Utilities.pharo13-dkh.12' ].
    spec
        for: #'pharo1.4.x'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo14-dkh.93';
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: 'MonticelloFileTree-FileDirectory-Utilities.pharo14-dkh.12' ].
    spec
        for: #'pharo2.x'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.pharo20-dkh.91';
                package: 'MonticelloFileTree-FileSystem-Utilities'
                    with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-dkh.17' ].
    spec
        for: #'squeak'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.squeak43-dkh.92';
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: 'MonticelloFileTree-FileDirectory-Utilities.squeak43-dkh.12' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'GsCore' with: '0.246';
                project: 'Monticello' with: '0.243'.
            spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.99';
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: 'MonticelloFileTree-FileDirectory-Utilities.gemstone24-dkh.14' ].

	spec for: #'gs3.1.0.x' do: [
		spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.99' ].

	spec for: #'gs3.2.0.x' do: [
		spec
                package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.99' ].
