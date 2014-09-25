class deptest_base::software::glassfish {

  # Anchor the class to ensure it's contained
  anchor { 'deptest_base::software::glassfish::begin': }

  anchor { 'deptest_base::software::glassfish::end': }

  # Create Glassfish group and user
  group { 'glassfish':
    ensure  => 'present',
    require => Anchor['deptest_base::software::glassfish::begin']
  }

  # Create the required user.
  user { 'glassfish':
    ensure     => 'present',
    managehome => true,
    comment    => 'Glassfish user account',
    gid        => 'glassfish',
    require    => Group['glassfish']
  }

  #
  # # Setup Glassfish
  #
  class { '::glassfish':
    java_ver        => 'java-7-openjdk',
    manage_accounts => false,
    before          => Anchor['deptest_base::software::glassfish::end']
  }


}
