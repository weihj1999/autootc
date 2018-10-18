# External ELB

<h2>Overview</h2>

This sample will :<br>
<ol start="1">
<li> Ctreee two ECS instances </li>
<li> Create an external classic Elastic Loadbalancer, external means that the loadbalancer will be public, and an vip will be assigned to it</li>
<li> Install tomcat into the ECS, and enable the service automtically</li>
<li> The external ELB will create Heath checker, listner and toher artifacts to reoute the request to the backend tomcat server</li>
</ol>

<h2>Configuration</h2>
The example create a new module for tomcat, you can also customize the config when create the cluster.

```HCL

module "tomcat" {
  source = "./tomcat"
  tenant_name="eu-de_ansible"
  count = 2
  flavor_name = "c2.large"
  #"RedHat7 Lastet"
  image_id = "e0846b8f-f433-4c5b-93c5-b6537ea13ec6"
  existing_private_net_id = "e3c83074-885b-4b2b-82e0-3acb94a8c26b"
  availability_zone ="eu-de-01"
  existing_subnet_id = "837a8a8b-6ac8-4612-99b3-00f59eb1303b"
  security_group_id = "d0a4d81d-b3cd-41d3-b39e-a3eaa0c12e8b"
  vpc_id = "5146a3c4-0615-457e-8775-023ec771ef99"
}
```

<h2>How to run</h2>
You may get the code to you local firstly, initialize terraform, plan the infrastrucure and deploy them. The below are for your reference:
<br>

```Shell
$ terraform init
$ terraform plan
$ terraform apply
$ terraform show

```



<h2>Notes</h2>

The tomcat service is installed by ansible playbook, you can also find it from this sample. The ansible playbook is inoked by an local_exec provisioner by terrafrom
```HCL
resource "null_resource" "ansible_ansible" {
   depends_on = ["opentelekomcloud_compute_instance_v2.az01-webtomcat"]
   provisioner "local-exec" {
     command = "sleep 120 && ansible-playbook -i /home/linux/extelb/tomcat/hosts /home/linux/extelb/tomcat/site.yml -vv"
  }
}
```

<h2></h2>

<h2></h2>
