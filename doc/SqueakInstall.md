## HOW TO INSTALL in Squeak

#### <a name="clone"></a>Clone FileTree git repository

```shell
    sudo mkdir /opt/git/
    sudo chmod og+rw /opt/git/
    cd /opt/git/
    git clone -b squeak4.3 https://github.com/dalehenrich/filetree.git
```

#### <a name="bootstrap"></a>Bootstrap FileTree into Image

```Smalltalk
    Installer ss3
        project: 'FileTree';
        install: 'ConfigurationOfFileTree'. 
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
```

####  <a name="loadlatest"></a>Load FileTree from Git repository

```Smalltalk
    Gofer new
        repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        load.
```

