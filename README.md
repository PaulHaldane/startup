# My standard Linux init/config files

to be installed in ~

## To copy files to a new machine/account

```
# next command only needed on HPE network - may need equivalent on other 
# networks that need proxies
export https_proxy=proxy.sdc.hp.com:8080
mkdir ~/repos
cd ~/repos
git clone https://github.com/PaulHaldane/startup.git
cd startup
./install.sh
```


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


## utils

The `bin` directory holds some useful utils

`qf` runs on macos and uses the built-in search index (as used by Finder) to 
do quick finds. Produces list of matching relative paths on stdout.

`qf0` is the same as `qf` but produces output suitable for feeding to `xargs -0`
so will handle paths containing white space.

See the `mdfind` man page for search options.

Examples:

```
qf searchstring

qf0 searchstring | xargs -0 ls -l

qf0 -name cshtml | xargs -0 grep searchstring
```

`awsAccount` returns the AWS account associated with the currently
configured AWS CLI credentials.
