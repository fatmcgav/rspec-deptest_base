require 'spec_helper'

describe 'deptest_base' do

  it {
    #Puppet::Util::Log.level = :debug
    #Puppet::Util::Log.newdestination(:console)
    should compile
  }

end
