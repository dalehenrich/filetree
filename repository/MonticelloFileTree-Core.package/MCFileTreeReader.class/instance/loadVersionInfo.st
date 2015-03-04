loading
loadVersionInfo
	self flag: 'hack to make MC happy... check this with GitFileTree'.

	info := MCVersionInfo
		name: self packageNameFromPackageDirectory , '-cypress.1'
		id: UUID new
		message: 'fabricated from a Cypress format repository'
		date: Date today
		time: Time now
		author: ''
		ancestors: #()
		stepChildren: #()