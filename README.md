# devEnv-cookbook

Sets up and configures a basic development environment

Installs:
* Oracle jdk 7
* maven 3
* git
* zsh
* nodejs
  * grunt-cli
* xvfb - to make x11 forwarding work
* atom

Configures:
* default shell: zsh
* oh-my-zsh
* solarized-dircolors
* dotfiles from github *default: oconnormi/dotfiles*

Other:
* Shares `~/.m2` with vm
* Shares `~/workspace` with vm

## Supported Platforms

* Debian
* Fedora

## Attributes

| Key                           | Type   | Description                        | Default                               |
|-------------------------------|--------|------------------------------------|---------------------------------------|
| ['devEnv']['dotfiles_repo']   | String | Url to a dotfiles git repository   | https://github.com/oconnormi/dotfiles |
| ['devEnv']['dotfiles_script'] | String | path to script to install dotfiles | scripts/bootstrap                     |

## Usage

### Vagrant

Assuming the requirements are met simply run `vagrant up` once the system is configured it will be accessible via `vagrant ssh`

Requirements:
* System
  * [vagrant](https://www.vagrantup.com/)
  * [virtualbox](https://www.virtualbox.org/wiki/Downloads)
  * [chef-dk](https://downloads.chef.io/chef-dk/)
* Vagrant Plugins
  * [vagrant-omnibus](https://github.com/chef/vagrant-omnibus)
  * [vagrant-berkshelf](https://github.com/berkshelf/vagrant-berkshelf)

Optional:
* System
  * x11 * for x11 forwarded applications
    * OSX: [XQuartz](http://xquartz.macosforge.org/landing/)
    * Windows: [xming](http://sourceforge.net/projects/xming/)
* Vagrant Plugins
  * [vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf) *Configures vms for use behind a proxy*
  * [landrush](https://github.com/phinze/landrush) *Configures dns resolution for vm <-> vm and host <-> vm*
  * [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier) *Caches resources between vagrant boxes*

#### Mac OSX Notes

To install the system requirements it is recommended that [homebrew cask](https://github.com/caskroom/homebrew-cask) is used

`brew cask install virtualbox`

`brew cask install vagrant`

`brew cask install chefdk`

#### \*Nix Notes
Either use your native package manager or check out [linuxbrew](http://brew.sh/linuxbrew/), a fork of [homebrew](http://brew.sh/) for linux. This does not have a homebrew cask equivalent yet, but works great for packages that may not exist in your distro's native package management repositories

#### Windows Notes
For windows [chocolatey](https://chocolatey.org/) is recommended for package installation

`choco install virtualbox`

`choco install vagrant`

`choco install chefdk`

`choco install xming`

### devEnv::default

Include `devEnv` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[devEnv::default]"
  ]
}
```

## License and Authors

Author:: Michael O'Connor (<oconnor.michael.stephen@gmail.com>)
