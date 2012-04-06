## HOW TO INSTALL

"Note that these instructions apply to Phase1 ... not yet alpha, so take care:)

Assuming Pharo 1.3"

### Bootstrap filetree code
```Smalltalk
Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
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

"If you clone the filetree repository, then you should use:

  '/opt/git/filetree/repository/'

as the path for attaching the FileTree repository.
"

### Attach to filetree repository and load latest packages (use correct path to your filetree download/clone)
```Smalltalk
Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
    package: 'MonticelloFileTree-Core';
    load.
```

