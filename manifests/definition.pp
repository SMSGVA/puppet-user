# simplify creating a local account
# with no password, but an RSA/DSA key
#
#
define ssh_user($comment,$uid,$group,$groups="",$shell="/bin/bash") {
  user { "$name":
    home       => "/home/$name",
    managehome => true,
    comment    => $comment,
    gid        => $group,
    groups     => $groups,
    require    => Group[$group],
    ensure     => present,
    uid        => $uid,
    shell      => $shell
  }

  # create ~/.ssh (~/ is created by User[$name])
  file { "/home/$name/.ssh":
    ensure  => directory,
    mode    => 700,
    owner   => $name,
    group   => $group,
    require => User[$name]
  }

  file { "/home/$name/.ssh/authorized_keys":
    source  => "puppet:///modules/user/authorized_keys/$name.pub",
    mode    => 400,
    owner   => $name,
    group   => $group,
    require => File["/home/$name/.ssh"]
  }
}
