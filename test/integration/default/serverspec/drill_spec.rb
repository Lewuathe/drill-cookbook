require 'spec_helper'

describe port(8047) do
  it { should be_listening }
end

describe port(31010) do
  it { should be_listening }
end

describe port(31011) do
  it { should be_listening }
end

describe port(31012) do
  it { should be_listening }
end

describe file('/opt/drill') do
  it { should be_directory }
end

describe file("/opt/drill/apache-drill-#{$node['default']['drill']['version']}/conf/drill-override.conf") do
  it { should contain $node['default']['drill']['cluster_id'] }
  it { should contain $node['default']['drill']['zk_connect'] }
end

describe command('free') do
  its(:stdout) { should match /Mem:      164\d{5} / }
end
