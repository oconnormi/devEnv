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

## Supported Platforms

* Debian
* Fedora

## Attributes

| Key                           | Type   | Description                        | Default                               |
|-------------------------------|--------|------------------------------------|---------------------------------------|
| ['devEnv']['dotfiles_repo']   | String | Url to a dotfiles git repository   | https://github.com/oconnormi/dotfiles |
| ['devEnv']['dotfiles_script'] | String | path to script to install dotfiles | scripts/bootstrap                     |

## Usage

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
