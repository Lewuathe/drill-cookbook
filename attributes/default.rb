default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '7'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['apt']['compile_time_update'] = true

default['drill']['install_dir'] = '/opt/drill'
default['drill']['version'] = '0.8.0'
default['drill']['mirror_url'] = "http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/drill/drill-#{node['drill']['version']}/apache-drill-#{node['drill']['version']}.tar.gz"
default['drill']['install_method'] = "remote_file"

default['drill']['cluster_id'] = 'drillbits1'
default['drill']['zk_connect'] = 'localhost:2181'
default['drill']['MAX_HEAP'] = '4G'
default['drill']['MAX_DIRECT_MEMORY'] = '8G'
