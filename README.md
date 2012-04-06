
## HOW TO INSTALL

The current configuration of **FileTree** has been tested in Pharo1.3 and Squeak4.3 and is 
expected to work in Pharo1.4.

### Bootstrap FileTree code
**Pharo**:

```Smalltalk
Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
  ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
```

**Squeak**:

```Smalltalk
Installer ss3
    project: 'FileTree';
    install: 'ConfigurationOfFileTree'. 
  ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.
```

### Download the filetree repository from GitHub by doing something like the following:
```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  curl -L https://github.com/dalehenrich/filetree/zipball/Phase1 > /tmp/git.zip
  unzip /tmp/git.zip -d /opt/git
```

### You can also clone the filetree repository if you already have git installed:
```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone https://github.com/dalehenrich/filetree.git
```

### Attach to filetree repository and load latest packages (use correct path to your filetree download/clone)

You can use the `+Repository` button in the **MonticelloBrowser** to attach to the filetree repository or execute the following:

```Smalltalk
Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
    package: 'MonticelloFileTree-Core';
    load.
```


