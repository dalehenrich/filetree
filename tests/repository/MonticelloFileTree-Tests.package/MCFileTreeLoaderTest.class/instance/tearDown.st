running
tearDown
    | anInstaller |
    super tearDown.
    anInstaller := Installer monticello.
    self tearDownPackages: anInstaller.
    anInstaller packages notEmpty
        ifTrue: [ anInstaller filetreeUnload ]