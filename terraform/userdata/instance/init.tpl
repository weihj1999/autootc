#cloud-config
---
groups:
- ugroup

users:
- default
- name: demo
  groups: [ ugroup ]
  sudo: [ "ALL=(ALL) NOPASSWD:ALL" ]
  shell: /bin/bash

runcmd:
- date

package_update: true
package_upgrade: true

packages:
- httpd
- screen
