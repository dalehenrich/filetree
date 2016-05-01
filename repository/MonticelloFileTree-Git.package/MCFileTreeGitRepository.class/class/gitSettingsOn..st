settings
gitSettingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #gitCommand)
		type: #File;
		label: 'Git command path' translated;
		parent: #monticello;
		target: self;
		description:
			'The path to the git command if not in the default external command path'
				translated