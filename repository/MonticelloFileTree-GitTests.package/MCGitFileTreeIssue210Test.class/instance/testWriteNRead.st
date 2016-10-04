tests
testWriteNRead
	| packageName versionInfo version repo |
	self deny: self hasTestPackage.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue 139');
		package: self testPackageName;
		load.
	versionInfo := self getTestPackage ancestors first.
	MCFileTreeGitRepository
		namesAt: versionInfo author
		put: 'Test Author'
		email: '<test+author@this-example.com>'.
	version := repo versionWithInfo: versionInfo.
	self getWriteTestRepository storeVersion: version.
	self getTestPackage unload.
	self deny: self hasTestPackage.
	self
		shouldnt: [ Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: self testPackageName;
				load ]
		raise: Error.
	self assert: self hasTestPackage.
	self
		assert: self getTestPackage ancestors first author
		equals: 'TestAuthor'.
	self
		validateTimestamp:
			((self getTopTimestampFor: 'Issue 139' in: 'issue 139')
				copyReplaceAll: 'ThierryGoubier'
				with: 'TestAuthor')