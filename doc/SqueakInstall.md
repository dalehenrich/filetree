## HOW TO INSTALL in Squeak

#### <a name="clone"></a>Clone FileTree git repository

```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b SQUEAK_BRANCH https://github.com/dalehenrich/filetree.git
```

Where **SQUEAK_BRANCH**: squeak4.3 (for Squeak4.3 and Squeak4.4).

#### <a name="bootstrap"></a>Bootstrap FileTree into Image

```Smalltalk
Installer ss3
        project: 'FileTree';
        install: 'MonticelloFileTree-Core.squeak43'.
```

####  <a name="loadlatest"></a>Load FileTree from Git repository 

Edit path to match `clone directory`:

```Smalltalk
Installer monticello
        mc: (MCFileTreeRepository directory:
                (FileDirectory uri: '/opt/git/filetree/repository/'));
        install: #('MonticelloFileTree-Core' 'MonticelloFileTree-FileDirectory-Utilities')
```

