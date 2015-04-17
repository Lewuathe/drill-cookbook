require 'serverspec'
require 'json'

set :backend, :exec

$node = JSON.parse(IO.read('/tmp/kitchen/nodes/default-ubuntu-1404.json'))
