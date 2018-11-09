# Cloud Config Used for user data injection

## Purpose
Create ECS instance on OTC and perform user adding, file provisioning for the instance.

## How to
Add user data with OS::Heat::CloudConfig <br>
```yaml
  server_init:
    type: OS::Heat::CloudConfig
    properties:
      cloud_config:
        write_files:
        - path: /tmp/test
          content: "Hello OTC"
        groups:
          - ugroup
        users:
          - default
          - name: demo
            gecos: demostration user
            primary_group: demo
            groups: users
            sudo: ALL=(ALL) NOPASSWD:ALL
            home: /home/demo
            plain_text_passwd: 'demo4otc'
            ssh_redirect_user: true

```

You may refer to the below online document for more detail<br>
https://docs.otc.t-systems.com/en-us/usermanual/ecs/en-us_topic_0032380449.html<br>
https://cloudinit.readthedocs.io/en/latest/topics/format.html<br>
https://cloudinit.readthedocs.io/en/latest/topics/examples.html<br>
https://github.com/openstack/heat-templates/blob/master/hot/software-config/example-templates/example-cloud-init.yaml

## Note
This feaure is supported by RTS(Resource Template Service) on OTC, and it is based on Openstack Heat. <br>
Since HEAT  was defaulting to HEAT_CFNTOOLS. it is considered legacy and RAW or SOFTWARE_CONFIG will generally be more appropriate.
Dont' forget to specify the data format to RAW or SOFTWARE_CONFIG when using HEAT

## Contact
[Hongjin WEI](https://github.com/weihj1999), weihongjin@huawei.com
