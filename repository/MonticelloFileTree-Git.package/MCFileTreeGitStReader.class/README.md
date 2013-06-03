This class handles reading a package from a git (via a specific commit ID).

Uses OS-Process to call git archive and retrieve a tar of the package; the tar is supposed to be cached (maybe, or later) and it uses tar to retrieve specific files and file lists (lists of entries).