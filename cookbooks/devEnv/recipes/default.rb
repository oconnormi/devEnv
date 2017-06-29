#
# Cookbook Name:: devEnv
# Recipe:: default
#

execute 'apt-get_update' do
  command 'apt-get update'
end

include_recipe 'git'

bash 'bootstrap_dotfiles' do
    code "su - ubuntu -c /home/ubuntu/.dotfiles/#{node['devEnv']['dotfiles_script']}"
    creates '/home/ubuntu/.git-prompt'
    action :nothing
end

git '/home/ubuntu/.dircolors' do
  repository 'https://github.com/seebi/dircolors-solarized.git'
  user 'ubuntu'
  group 'ubuntu'
  action :sync
end

git '/home/ubuntu/.oh-my-zsh' do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  user 'ubuntu'
  group 'ubuntu'
  action :sync
end

git '/home/ubuntu/.dotfiles' do
  repository node['devEnv']['dotfiles_repo']
  user 'ubuntu'
  group 'ubuntu'
  action :sync
  notifies :run, 'bash[bootstrap_dotfiles]', :immediately
end

include_recipe 'java'
include_recipe 'maven'
package 'zsh'

user 'ubuntu' do
  shell '/bin/zsh'
  action :modify
end

include_recipe 'xvfb'

include_recipe 'atom::default'

package 'atom'
