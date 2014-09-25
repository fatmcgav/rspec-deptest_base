require 'spec_helper'

describe 'deptest_base::software::glassfish' do

  it { should compile }

  # Anchors
  it { should contain_anchor('deptest_base::software::glassfish::begin') }
  it { should contain_anchor('deptest_base::software::glassfish::end') }

  it { should contain_group('glassfish').with_ensure('present').
    that_requires('Anchor[deptest_base::software::glassfish::begin]') }

  it { should contain_user('glassfish').with( {
    'ensure'     => 'present',
    'managehome' => true,
    'comment'    => 'Glassfish user account',
    'gid'        => 'glassfish'
    } ).that_requires('Group[glassfish]')
  }

  it { should contain_class('glassfish').with({ 
    'java_ver' => 'java-7-openjdk', 
    'manage_accounts' => false 
    }).that_comes_before('Anchor[deptest_base::software::glassfish::end]')
  }

end
