#vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:
###############################################################
# @filename : virtual.pp
# @created : Sun, 05 Jun 2011 16:55:10 +1000
# @last changed: Sun 05 Jun 2011 20:35:21 EST
# @author : Mick Pollard <aussielunix@gmail.com>
###############################################################
class user::virtual {
  import 'definition'

  @group {'lunix':
    gid => '5000',
  }

  @group {"deploy":
    gid => '5001',
  }

  @ssh_user {'lunix':
    comment	=> 'Mick Pollard',
    uid		=> '5000',
    group	=> 'lunix',
    groups	=> 'sudo',
    shell	=> '/bin/bash',
  }

  @ssh_user {'deploy':
    comment	=> 'application deployment user',
    uid		=> '5001',
    group	=> 'deploy',
    groups	=> 'sudo',
    shell	=> '/bin/bash',
  }
}


