# External ELB

<h2>Overview</h2>

This sample will :<br>
<ol start="1">
<li> Ctreee two ECS instances </li>
<li> Create an external classic Elastic Loadbalancer, external means that the loadbalancer will be public, and an vip will be assigned to it</li>
<li> Install tomcat into the ECS, and enable the service automtically</li>
<li> The external ELB will create Heath checker, listner and toher artifacts to reoute the request to the backend tomcat server</li>
</ol>

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

<h2></h2>

<h2></h2>
