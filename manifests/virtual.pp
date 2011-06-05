#vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:
###############################################################
# @filename : virtual.pp
# @created : Sun, 05 Jun 2011 16:55:10 +1000
# @last changed: Sun 05 Jun 2011 17:27:52 EST
# @author : Mick Pollard <aussielunix@gmail.com>
###############################################################
class user::virtual {

  @group {'lunix':
    gid => '5000',
  }

  @group {"deploy":
    gid => '5001',
  }

  @user {'lunix':
    ensure	=> 'present',
    comment	=> 'Mick Pollard',
    managehome	=> true,
    uid		=> '5000',
    gid		=> 'lunix',
    groups	=> 'sudo',
    shell	=> '/bin/bash',
  }

  @user {'deploy':
    ensure	=> 'present',
    comment	=> 'application deployment user',
    managehome	=> true,
    uid		=> '5001',
    gid		=> 'deploy',
    groups	=> 'sudo',
    shell	=> '/bin/bash',
  }
}


