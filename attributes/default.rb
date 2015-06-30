default['devEnv']['dotfiles_repo'] = 'https://github.com/oconnormi/dotfiles.git'
default['devEnv']['dotfiles_script'] = 'scripts/bootstrap'

#xvfb attributes
default['xvfb']['args'] = '-ac'

# Java Attributes
default['devEnv']['install_java'] = true
default['java']['jdk_version'] = '7'
default['java']['set_etc_environment'] = true
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['oracle_rpm']['type'] = 'jdk'
default['java']['set_default'] = true
default['java']['install_flavor'] = 'oracle'

# Maven Attributes
default['devEnv']['install_maven'] = true
default['maven']['setup_bin'] = true
default['maven']['install_java'] = false
