# Bootstrap

Bootstrapping to get Puppet, the CollectionSpace Puppet modules, and their respective dependencies,
along with the Hiera key/value store, onto a host.

**Please make changes on the appropriate branch for the CollectionSpace
version to be installed**: e.g. `v4.2`, `v4.1`. And create new branches
for new CollectionSpace versions. (The `master` branch is now deprecated.)

## Platform support

These are the actively tested platforms for the installer:

- Ubuntu Bionic (18.04 LTS)

## Local development

Start by pulling the cspace puppet modules:

```bash
./setup.sh v5.2-branch # branch of current version
```

The default [Vagrant](#) configuration uses Ubuntu:

```bash
vagrant plugin install vagrant-vbguest
vagrant up
```

To use another OS prefix the vagrant command with the image:

```bash
CSPACE_PUPPET_BOOTSTRAP_BOX=centos/7 vagrant up
```

Note: support for any OS not listed under "Platform Support" is experimental
and not guaranteed to work. Pull requests are welcome!
