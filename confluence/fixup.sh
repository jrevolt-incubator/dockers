#!/bin/bash

sed -i '
/<\/Context>/i \
<Valve className="org.apache.catalina.valves.RemoteIpValve" protocolHeader="X-Forwarded-Proto"/>
' /opt/atlassian/confluence/conf/server.xml

grep RemoteIpValve -B3 -A3 /opt/atlassian/confluence/conf/server.xml

cat > /usr/local/share/ca-certificates/ca.crt << EOF
-----BEGIN CERTIFICATE-----
MIID/TCCAuWgAwIBAgIJAKJEtS6al6xDMA0GCSqGSIb3DQEBCwUAMIGbMRYwFAYD
VQQDDA1DbG91ZCBDQSBSb290MRUwEwYKCZImiZPyLGQBGRYFY2xvdWQxFTATBgoJ
kiaJk/IsZAEZFgVsb2NhbDEQMA4GA1UECgwHSlJldm9sdDEfMB0GA1UECwwWUmVz
ZWFyY2ggJiBEZXZlbG9wbWVudDETMBEGA1UEBwwKQnJhdGlzbGF2YTELMAkGA1UE
BhMCU0swHhcNMTYwNDI1MjE1MTQyWhcNNDMwOTEwMjE1MTQyWjCBmzEWMBQGA1UE
AwwNQ2xvdWQgQ0EgUm9vdDEVMBMGCgmSJomT8ixkARkWBWNsb3VkMRUwEwYKCZIm
iZPyLGQBGRYFbG9jYWwxEDAOBgNVBAoMB0pSZXZvbHQxHzAdBgNVBAsMFlJlc2Vh
cmNoICYgRGV2ZWxvcG1lbnQxEzARBgNVBAcMCkJyYXRpc2xhdmExCzAJBgNVBAYT
AlNLMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApgxs2fv9y0dQEq5+
BDhNqqqtOnkEmRlB+bJkrzNzSh4lRgNFhTFFVkHIqw8WBlkxEZltO+bk+q7g56IZ
/TLvhWFoGQvBwZuBj5qWcztVNvsVYdPyakpzkVSvxkdq8Pfxlpy0hH2HJEhVLHmF
0Ujlbbw51gN5D44CdYdQ6YOd7DDWYW74I5EfUnijyTcbikcsNe/1MaEck+BdnSV5
JnNoAzh16J3L3WUYWyqbjcLksFXqadCSfaqEW81wW9N4bZ0jmRUjkJjJ08tzbbPZ
mnIMUB0YX3Umz550xJFeXaORjKsBgaLNAIsaIvotjoDWAsa1HDD+lv7SxTG//BRB
41f1HwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAd
BgNVHQ4EFgQUj8KQwSfwRnXkUBTj4Hux90gPeHQwDQYJKoZIhvcNAQELBQADggEB
AIboP6lMD6QKVegIP2V3uZhfTvd9IVmupiSkJ135Lga8KS+o8/J98ZpkWuHdyEMV
mWFxRuybO2qmjInqZN8YPiUhTp79Pm+v5GaXeq5YcKUsWxyCC06VGTmUtpwfCGQS
TdQkxg0QKXmND9NuuXvg8CcC7zJv1G6NK3xxTiLBHURD7Fdj5WXLDn0KV+frCOde
Q540ZfiUVG5USHkBKarj4lJKKMdZKl0rMQqMgi/LNLEXCHfiRSWfJlSW9Pbw+tqo
OC6C+AzExAnVHRWaE9Qo5FvWiU2pXU33ap2h90mb+TzPI1kM74wAGj9gDUvmOS2Q
RsZV4HDCUz2Umsfav2cHsKA=
-----END CERTIFICATE-----
EOF

ls -l $(realpath $(dirname $(realpath $(which java)))/../lib/security/cacerts)
update-ca-certificates
ls -l $(realpath $(dirname $(realpath $(which java)))/../lib/security/cacerts)

