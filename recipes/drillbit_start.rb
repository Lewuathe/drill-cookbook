#
# Cookbook Name:: drill-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Kai Sasaki, All Rights Reserved.

drill_remote_name = node['drill']['mirror_url']
drill_package_name = "apache-drill-#{node['drill']['version']}"
install_dir = node['drill']['install_dir']

execute "start drillbit" do
  command "./opt/drill/#{drill_package_name}/bin/drillbit.sh restart"
  action :run
end
