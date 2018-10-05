# Heat

## Overview  

<br/>
Resource Template Service (RTS) makes it easier for you to simplify your cloud computing resource management and automatic O&M. Based on the template specifications defined in the RTS service, you can compile a template file and define a collection of cloud computing resources, dependencies between resources, and resource configurations. Then you can automatically create and configure all resources in the template by using the orchestration engine so as to implement automatic deployment and simplify O&M. The RTS service supports most native OpenStack Heat APIs and templates in the Heat Orchestration Template (HOT) format.
<br/>

<h2>Note</h2> 

The environment variables in the following commands are for reference only. You need to import the environment variables based on your system settings.
```
export OS_USERNAME="user_name" 
export OS_USER_DOMAIN_NAME=user_domain_name 
export OS_PASSWORD=******* 
export TENANT_ID=********

#Only change these for a different region
export OS_TENANT_NAME=az1 
export OS_PROJECT_NAME=az1 
export OS_AUTH_URL=https://iam.az1.domainname.com:443/v3

#No changes needed beyond this point
export NOVA_ENDPOINT_TYPE=publicURL 
export OS_ENDPOINT_TYPE=publicURL 
export CINDER_ENDPOINT_TYPE=publicURL 
export OS_VOLUME_API_VERSION=2 
export OS_IDENTITY_API_VERSION=3 
export OS_IMAGE_API_VERSION=2
```

<h2>Structure</h2>

