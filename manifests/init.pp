class deptest_base {

  case $::kernel {
    'Linux' : { include deptest_base::os::linux }
    default : { fail("Kernel ${::kernel} not supported.") }
  }

}
