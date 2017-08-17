# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/DM_Multipath/config_file_blacklist.html
#
# * Blacklisting by WWID
#
# blacklist {
#        wwid 26353900f02796769
# }
#
# * Blacklisting By Device Name
#
# blacklist {
#        devnode "^sd[a-z]"
# }
#
# * Blacklisting By Device Type
#
# blacklist {
#        device {
#                vendor  "IBM"
#                product "3S42"       #DS4200 Product 10
#        }
#        device {
#                vendor  "HP"
#                product "*"
#        }
# }
define multipathd::blacklist() {
  # TODO
}
