This class handles reading a package from a git (via a specific commit ID).

Uses OS-Process to call git archive and retrieve a zip of the package. Then sort of reuse the superclass implementation (MczReader?) even if the StCypress format is different.

Remember:
	* stream is the directory holding the .package directory.
	* Package directory is NameOfPackage.package.
	* zip contains the archive of the package (the contents of NameOfPackage.package according to the commitID)
	
Complex work-arounds to handle incorrect incoming streams; see parseMember: