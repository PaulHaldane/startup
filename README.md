# My standard Linux init/config files

to be installed in ~

## ssh/git

The ssh setup for github (which I assume is also appropriate for gitlab etc) is
based on the answers to
http://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config

This needs a host entry for each repo and an associated ssh key-pair.

For example:

For a Github repo called ansible1.

1. Generate a new ssh key
 ```
ssh-keygen -f ~/.ssh/github_ansible1
```

2. Add the generated public key as a deploy key for that repo on Github
  1. Do this using the web interface under Settings.

3. Add a new stanza to the .ssh/config file
 ```
Host github-ansible1
	Hostname        github.com
	User git
	IdentityFile    ~/.ssh/github_ansible1
	IdentitiesOnly	yes
```

4. Clone the repo using the hostname defined in the new stanza
 ```
git clone git@github-ansible1:PaulHaldane/ansible1.git
```
