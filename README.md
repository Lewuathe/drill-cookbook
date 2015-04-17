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
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['drill']['install_dir']</tt></td>
    <td>String</td>
    <td>Drill package is installed here.</td>
    <td><tt>/opt/drill</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['version']</tt></td>
    <td>String</td>
    <td>Drill version.</td>
    <td><tt>0.8.0</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['mirror_url']</tt></td>
    <td>String</td>
    <td>Drill package is downloaded from here.</td>
    <td><tt>http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/drill/drill-#{node['drill']['version']}/apache-drill-#{node['drill']['version']}.tar.g</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['install_method']</tt></td>
    <td>String</td>
    <td>Set to remote_file to download from drill.apache.org.</td>
    <td><tt>cookbook_file</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['cluster_id']</tt></td>
    <td>String</td>
    <td>The ID of Drillbits cluster.</td>
    <td><tt>drillbits1</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['zk_connect']</tt></td>
    <td>String</td>
    <td>ZooKeeper host name and port.</td>
    <td><tt>localhost:2181</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['MAX_HEAP']</tt></td>
    <td>String</td>
    <td>Max heap size used by drill JVM.</td>
    <td><tt>4G</tt></td>
  </tr>

  <tr>
    <td><tt>['drill']['MAX_DIRECT_MEMORY']</tt></td>
    <td>String</td>
    <td>You can increase the direct buffer memory which is distinct from heap.</td>
    <td><tt>8G</tt></td>
  </tr>
</table>


Usage
-----
If you use `cookbook_file` option, first you have to add your drill package under `files/default` as tar.gz format.

```
$ cp <your storm package> cookbooks/drill/files/default/
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
