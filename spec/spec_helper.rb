require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera'
require 'rspec-puppet'

fixture_path = File.expand_path(File.join(Dir.pwd, 'spec/fixtures'))

# Add fixture lib dirs to LOAD_PATH. Work-around for PUP-3336
#
if Puppet.version < "4.0.0"
  Dir["#{fixture_path}/modules/*/lib"].entries.each do |lib_dir|
    $LOAD_PATH << lib_dir
  end
end

RSpec.configure do |c|
  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
  
  c.default_facts = {
    :kernel => 'Linux',
    :operatingsystem => 'CentOS',
    :operatingsystemrelease => '6.5',
    :lsbmajdistrelease => '6',
    :osfamily => 'RedHat',
    :architecture => 'x86_64',
    :concat_basedir => "/tmp/concat",
  }
end
