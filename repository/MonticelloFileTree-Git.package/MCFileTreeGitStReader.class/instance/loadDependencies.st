utilities
loadDependencies
	"Not entirely sure of how that works, but... We'll try."

	| dependencyDir |
	dependencyDir := packageDirectory , self slash , self monticelloMetaDirName , self slash , 'dependencies' , self slash.
	dependencies := OrderedCollection new.
	(self zip members select: [ :entry | entry isDirectory not and: [ entry fileName beginsWith: dependencyDir ] ])
		do: [ :entry | 
			| name |
			name := entry splitFileName last.
			dependencies
				add:
					(MCVersionDependency
						package: (MCPackage named: name)
						info: (self extractInfoFrom: (self parseMember: 'dependencies' , self slash , name))) ].
	dependencies := dependencies asArray