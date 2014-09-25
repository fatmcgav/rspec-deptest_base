require 'spec_helper'

describe 'deptest_base::software::glassfish' do

  it { should compile }

  it { should contain_group('glassfish').with_ensure('present') }

  it { should contain_user('glassfish').with( {
    'ensure'     => 'present',
    'managehome' => true,
    'comment'    => 'Glassfish user account',
    'gid'        => 'glassfish'
    } ).that_requires('Group[glassfish]')
  }

end
