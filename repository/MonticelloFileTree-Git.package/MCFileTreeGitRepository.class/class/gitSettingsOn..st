settings
gitSettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #monticello)
		with: [ 
			(aBuilder setting: #gitCommand)
				type: #File;
				label: 'Git command path' translated;
				target: self;
				description: 'The path to the git command if not in the default external command path' translated ]