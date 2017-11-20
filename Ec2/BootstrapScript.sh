#cloud-config
 
# This example assumes the instance is 12.04 (precise)
# The default is to install from packages.
 
# Key from
apt_upgrade: true
apt_sources:
- source: "deb  $RELEASE-0.10 main"
key: |
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.9 (GNU/Linux)
 
mQGiBEppC7QRBADfsOkZU6KZK+YmKw4wev5mjKJEkVGlus+NxW8wItX5sGa6kdUu
zIhi7tKFo6WiwjKZq0dzctsJJjtIfr4K4vbiD9Ojg1iISQQYEQIACQUCSmkLtAIb
........
DAAKCRApQKupg++CauISAJ9CxYPOKhOxalBnVTLeNUkAHGg2gACeIsbobtaD4ZHG
0GLl8EkfA8uhluM=
=zKAm
-----END PGP PUBLIC KEY BLOCK-----
 
#The above will verify that the we are downloading is from trusted source
chef:
run_list:
- "recipe[nginx]"
 
# Valid values are 'gems' and 'packages' and 'omnibus'
install_type: "packages"
 
# Boolean: run 'install_type' code even if chef-client
# appears already installed.
force_install: false
 
# Chef settings
server_url: "https://ip-X-X-X-X.ec2.internal/organizations/organisation-name"
 
# Node Name
# Defaults to the instance-id if not present
node_name: "#{Socket.gethostname}-test"
# Default validation name is organisation-validator
validation_name: "organisation-validator"
validation_key: |
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAw75CltGJ1oYf980m1B9soHbDVK/6l1dhgzd86aW8GjFpqfz8
Q9kXZ3wrLOxJ64+vIF1qouMzgtoGCayZ00t62MnCZodgPCzccHY0CZKOKx2V1dDW
PAt1veQkXODDLilFiGfTlwBud+O1JLoDa5Nxt6y9INL21IGx3sXi54Z7Df98ZS2z
5K5IzLjRsjmh2NhwG/fB7xRYXaImHrjua7c309rH411Pgo1xcQb9xETU4WaOyl/C
......
QEo7WQKBgGKenUL/CmBmehY6EBfsYyq1Pbwn/f3n1D0w61ef+zBD0KVnO78dZozq
Wd2pd4EHxp4+V1NEGCF47YVfiO+D9Lk3V4ic+1kVfYCsefygdbr5i1C4zUVOGcso
QcbwgH/doZL7MfiofwHP8MupY410UQnnV2it72Ml+bJf9Q7ezjsX
-----END RSA PRIVATE KEY-----
 
#The above key is organisation-validator.pem which is present on the chef server