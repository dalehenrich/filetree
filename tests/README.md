## Structure

The **repository** directory contains the test packages.

The **testRepositories** directory contains sample packages that are used by the tests.

## Installing Tests


```Smalltalk
  Gofer new
    repository: (MCFileTreeRepository new directory:
                    (FileDirectory on: '/opt/git/filetree/tests/repository/'));
    package: 'MonticelloFileTree-Tests';
    load.
```
