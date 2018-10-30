module "tomcat" {
  source = "./tomcat"
  tenant_name="eu-de_ansible"
  count = 2
  flavor_name = "c2.large"
  #"RedHat7 Lastet"
  image_id = "e0846b8f-f433-4c5b-93c5-b6537ea13ec6"
  existing_private_net_id = "e3c83074-885b-4b2b-82e0-3acb94a8c26b"
  existing_subnet_id = "837a8a8b-6ac8-4612-99b3-00f59eb1303b"
  security_group_id = "d0a4d81d-b3cd-41d3-b39e-a3eaa0c12e8b"
  vpc_id = "5146a3c4-0615-457e-8775-023ec771ef99"
}
