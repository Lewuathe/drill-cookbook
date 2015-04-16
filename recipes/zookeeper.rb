#
# Cookbook Name:: drill-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Kai Sasaki, All Rights Reserved.

include_recipe "zookeeper"

zookeeper '3.4.6' do
  user     'zookeeper'
  mirror   'http://www.poolsaboveground.com/apache/zookeeper'
  checksum '01b3938547cd620dc4c93efe07c0360411f4a66962a70500b163b59014046994'
  action   :install
end

service 'zookeeper' do
  start_command 'sudo /opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start'
  action :start
end
