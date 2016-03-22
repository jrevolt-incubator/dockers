#!/bin/bash
tail -F /var/log/apache2/access.log 2>/dev/null &
tail -F /var/log/apache2/error.log  2>/dev/null &
httpd -DFOREGROUND "$@"

