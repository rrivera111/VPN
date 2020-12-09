Role Name
=========

This role designed for install and configure Openvpn server with certificate based authentication

Requirements
------------

Tested on Ubuntu Server 20<br>

* Install Ansible<br>
`apt install ansible`
* Copy ansible folder from repository to `/etc/ansible`
`cp ansible /etc/ansible`
* Open for editing `/etc/ansible/hosts` and replace ip address in `[openvpn-server]` section to your server IP address
```
[openvpn-server]
18.198.22.161
```
* cd to `/etc/ansible/playbooks` folder
`cd /etc/ansible/playbooks`
* Run playbook
`ansible-playbook OpenVPNServer.yml -e '{"target":"openvpn-server"}' --private-key /path/to/your/ssh/key.pem`


Role Variables
--------------

* Local network that should be routed to VPN avi_network
```
local_network: 172.24.0.0
local_network_mask: 255.255.0.0
```
* Client configuration directory
`ccd_dir: /etc/openvpn/ccd`
* VPN subnet
```
vpn_subnet: 10.10.10.0
vpn_subnet_mask: 255.255.255.0
```
* IP address for Lan router in VPN network
`lan_router_ip: 10.10.10.3`
* Server protocol
`server_proto: udp`
* Server port
`server_port: 2194`
* User for connecting by SSH
`ansible_user: ubuntu`

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```json
- name: Install OpenVPN
  hosts: '{{target}}'

  roles:
    - { role: openvpn-server, become: yes }
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
