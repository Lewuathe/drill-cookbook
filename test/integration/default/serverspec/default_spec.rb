require 'spec_helper'

describe host('192.168.33.33') do
  it { should be_reachable }
end
