baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                configuration: 'OSProcess'
                   with: [
                       spec
                           versionString: #'stable';
                           repository: 'http://www.squeaksource.com/MetacelloRepository' ];
                yourself.
           spec
                configuration: 'ProcessWrapper'
                   with: [
                       spec
                           versionString: #'stable';
                           repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main' ];
                yourself.
            spec
                package: 'MonticelloFileTree-Core';
                package: 'MonticelloFileTree-Tests' with: [ spec requires: #('default') ];
                package: 'MonticelloFileTree-FileSystem-Utilities'
                    with: [ spec requires: #('MonticelloFileTree-Core') ];
                package: 'MonticelloFileTree-FileSystem-Tests'
                    with: [ spec requires: #('MonticelloFileTree-Tests') ];
                package: 'MonticelloFileTree-Git'
                    with: [ spec requires: #('MonticelloFileTree-Core' 'OSProcess' 'ProcessWrapper') ];
                package: 'MonticelloFileTree-GitTests'
                    with: [ spec requires: #('MonticelloFileTree-Git' 'MonticelloFileTree-Tests') ];
                yourself.
            spec
                group: 'default' with: #('MonticelloFileTree-Core' 'MonticelloFileTree-FileSystem-Utilities');
                group: 'Tests' with: #('MonticelloFileTree-Tests' 'MonticelloFileTree-FileSystem-Tests');
                group: 'Git' with: #('MonticelloFileTree-Git');
                group: 'Git Tests' with: #('MonticelloFileTree-GitTests');
                group: 'TravisCI' with: #('Tests' 'Git Tests');
                yourself ]
