#vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:
################################################################
# @filename : init.pp
# @created : Sun, 05 Jun 2011 16:55:10 +1000
# @last changed: Sun 05 Jun 2011 17:18:28 EST
# @author : Mick Pollard <aussielunix@gmail.com>
################################################################
# Class: user
#
# This module manages users and groups
#
# Parameters:
#
# Actions:
#
# Requires:
#
#
class user inherits user::virtual {
  realize(Group["lunix"])
  realize(Group["deploy"])
  realize(User["lunix"])
  realize(User["deploy"])
}
