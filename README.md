# drill-cookbook

 ![drill](https://img.shields.io/cookbook/v/drill.svg) ![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)
==============

This is a chef cookbook for [Apache Drill](http://drill.apache.org/)

Download
----------
[drill: Chef Supermarket](https://supermarket.chef.io/cookbooks/drill)

Requirements
------------
Chef: 11.18.0+
java

Attributes
----------

#### storm::default

|Key|Type|Description|Default|
|:---|:---|:---|:---|
|['drill']['install_dir']|String|Drill package is installed here.|/opt/drill|
|['drill']['version']|String|Drill version.|0.8.0|
|['drill']['mirror_url']|String|Drill package is downloaded from here.|http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/drill/drill-#{node['drill']['version']}/apache-drill-#{node['drill']['version']}.tar.g|
|['drill']['install_method']|String|Set to remote_file to download from drill.apache.org.|cookbook_file|
|['drill']['cluster_id']|String|The ID of Drillbits cluster.|drillbits1|
|['drill']['zk_connect']|String|ZooKeeper host name and port.|localhost:2181|
|['drill']['MAX_HEAP']|String|Max heap size used by drill JVM.|4G|
|['drill']['MAX_DIRECT_MEMORY']|String|You can increase the direct buffer memory which is distinct from heap.|8G|

Usage
-----
If you use `cookbook_file` option, first you have to add your drill package under `files/default` as tar.gz format.

```
$ cp <your drill package> cookbooks/drill/files/default/
```

## Recipes

For setting up drillbit configuration.

### drillbit
For nimbus node

```json
{
  "name":"drillbit",
  "run_list": [
    "drill::drillbit"
  ]
}
```

### Start drillbit
For starting drillbit

```json
{
  "name":"drillbit_start",
  "run_list": [
    "drill::drillbit_start"
  ]
}
```

It is also necessary to construct zookeeper quorum.

### ZooKeeper
```json
{
  "name": "zookeeper",
  "run_list": [
    "drill::zookeeper"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:
* Kai Sasaki([Lewuathe](https://github.com/Lewuathe))


This cookbook is distributed under [MIT License](http://opensource.org/licenses/MIT)
