Beginer

This example will create cloud server(ECS instance), vpc(include subnet) and a volume (ECS)


Running the example


1. Fetch code with git 
2. init terraform environment

$terraform init
3. plan the infrastructure

$terraform plan
4. deploy your infra

$terraform apply
5. check your infra

$terraform show
6. check graph topology

$terraform graph
7. export your graph

$terraform| DOT -Tpdf > myGRAPH.PDF
8. destroy your infra

$terraform destroy
