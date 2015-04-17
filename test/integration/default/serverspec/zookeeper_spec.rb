require 'spec_helper'

describe port(2181) do
  it { should be_listening }
end

describe file('/opt/zookeeper') do
  it { should be_directory }
end
