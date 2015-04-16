#
# Cookbook Name:: drill-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Kai Sasaki, All Rights Reserved.

include_recipe 'drill::default'

drill_remote_name = node['drill']['mirror_url']
drill_package_name = "apache-drill-#{node['drill']['version']}"
install_dir = node['drill']['install_dir']

group 'drill' do
  action :create
end

user 'drill' do
  comment 'For drill services'
  gid 'drill'
  home '/home/drill'
  shell '/bin/bash'
  action :create
end

directory node['drill']['install_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

case node['drill']['install_method']
when 'cookbook_file'
  cookbook_file "/tmp/#{drill_package_name}.tar.gz" do
    source "#{drill_package_name}.tar.gz"
  end
when 'remote_file'
  remote_file "/tmp/#{drill_package_name}.tar.gz" do # ~FC013
    source drill_remote_name
  end
end

script 'install_storm' do
  interpreter 'bash'
  user 'root'
  code <<-EOL
    rm -rf #{install_dir}/*
    tar xvzf /tmp/#{drill_package_name}.tar.gz -C #{install_dir}
    chown -R drill:drill #{install_dir}
  EOL
  not_if { ::File.exist?("#{install_dir}/#{drill_package_name}") }
end

template "#{install_dir}/#{drill_package_name}/conf/drill-override.conf" do
  source 'drill-override.conf.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables(
    'cluster_id' => node['drill']['cluster_id'],
    'zk_connect' => node['drill']['zk_connect']
  )
end

template "#{install_dir}/#{drill_package_name}/conf/drill-env.sh" do
  source 'drill-env.sh.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables(
    'MAX_HEAP' => node['drill']['MAX_HEAP'],
    'MAX_DIRECT_MEMORY' => node['drill']['MAX_DIRECT_MEMORY']
  )
end
