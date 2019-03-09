settings
fossilSettingsOn: aBuilder
	"The group for such settings is #monticello, even if it is labelled Monticello."

	<systemsettings>
	(aBuilder setting: #fossilCommand)
		type: #File;
		label: 'Fossil command path' translated;
		parent: #monticello;
		target: self;
		description:
			'The path to the fossil command if not in the default external command path'
				translated