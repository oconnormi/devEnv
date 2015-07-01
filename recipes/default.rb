#
# Cookbook Name:: devEnv
# Recipe:: default
#

execute 'apt-get_update' do
  command 'apt-get update'
end

include_recipe 'git'

bash 'bootstrap_dotfiles' do
    code "su - vagrant -c /home/vagrant/.dotfiles/#{node['devEnv']['dotfiles_script']}"
    creates '/home/vagrant/.git-prompt'
    action :nothing
end

git '/home/vagrant/.dircolors' do
  repository 'https://github.com/seebi/dircolors-solarized.git'
  user 'vagrant'
  group 'vagrant'
  action :sync
end

git '/home/vagrant/.oh-my-zsh' do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  user 'vagrant'
  group 'vagrant'
  action :sync
end

git '/home/vagrant/.dotfiles' do
  repository node['devEnv']['dotfiles_repo']
  user 'vagrant'
  group 'vagrant'
  action :sync
  notifies :run, 'bash[bootstrap_dotfiles]', :immediately
end

include_recipe 'java'
include_recipe 'maven'
include_recipe 'zsh'

user 'vagrant' do
  shell '/bin/zsh'
  action :modify
end

include_recipe 'nodejs::nodejs'

nodejs_npm "grunt-cli"

nodejs_npm "bower"

include_recipe 'xvfb'

include_recipe 'atom::default'

package 'atom'
