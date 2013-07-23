A MCFileTreeGitRepository adds git commands via OSProcess when saving a package in a filetree.
Uses gitfiletree: as a protocol (:().

Commands done so far:
git add name.package; git commit ...
git add .filetree
	when creating the repository
git archive
	on a specific commit, retrieve the package (or part of it)

Git commands of interest:

git status
	To test if we are really in a git repo and that the git command works.
git log --follow --pretty="%H" --no-notes MonticelloFileTree-Git.package/monticello.meta/version
	To get all the commitIDs with all the versions of the packages.
git archive 5562cc769a36b0cdf29dbcb53aa84704b72ce60d MonticelloFileTree-Git.package/monticello.meta/version | tar x -O
	Will dump the version file for that specific commit on the command line, so that we may recover all we need from it.
	
Implementation. Get all commits hashes related to a package versions. Then get all version files to recover the data. Store the version and hash in the listing in the GUI... Now, about loading it... Change the reader to bring along the hash for that version, and use the git archive trick to load each package as a zip.

Has now a Gofer interface. Tries to correctly load utf8 data from the zip archive. Cuts the runtime by two.

[MCFileTreeGitRepository allInstances first cacheAllFileNamesDuring: [  Gofer new url: 'gitfiletree:///home/thierry/src/GitFileTree/AltBrowser'; version: 'ConfigurationOfAltBrowser-ThierryGoubier.1'; load]] timeToRun
