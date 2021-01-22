**NGINX API Automation Workshop**

The project lives at :  [https://github.com/temporarychicken/NGINX_API_Automation](https://github.com/temporarychicken/NGINX_API_Automation)

**Prerequsites:**

 1. Either, a jumphost (or set of jumphosts). These will be created for you by your course instructor
or
 2.  Run natively from a MAC with packer and terraform command line tools installed. No instructor is required but you will need to install packer, terraform, and ansible.

As a course instructor, you can create jumphosts for a workshop using the following project:

[https://github.com/temporarychicken/jumphosts-London](https://github.com/temporarychicken/jumphosts-London)

Edit the variable instance_count in  jumphosts.tf to reflect the number of workshops you wish to create.
To obtain a list of jumphosts for course delgates you can type:

    terraform show |grep public_dns
 to get a list of jumphosts, which should look something like:


    public_dns = "[ec2-18-134-15-94.eu-west-2.compute.amazonaws.com](http://ec2-18-134-15-94.eu-west-2.compute.amazonaws.com/)"  
    public_dns = "[ec2-35-179-75-75.eu-west-2.compute.amazonaws.com](http://ec2-35-179-75-75.eu-west-2.compute.amazonaws.com/)"  
    public_dns = "[ec2-35-178-102-94.eu-west-2.compute.amazonaws.com](http://ec2-35-178-102-94.eu-west-2.compute.amazonaws.com/)"

RDP onto the jumphost with a suitable client (microsoft RDP client works in Windows and MacOS)

Username and password for the remote desktop are: ubnutu ubuntuworkshop

Choose "use default config for the desktop"

You should then see a mouse. Not merely a mouse pointer, but a small mouse picture on the new desktop background.

To increase remote desktop performance and reduce latency, try reducing the desktop resolution and colour depth of your remote desktop connection.

Now you're connected to the workshop remote desktop, open a shell terminal using the icon at the bottom of the desktop.

Clone the NGINX API Automation workshop into your jumphost locally:

    git clone  https://github.com/temporarychicken/NGINX_API_Automation

Obtain some AWS credentials from your workshop host, or use your own. They should be in the format of environment variables, and should look like this:

    export AWS_ACCESS_KEY_ID="ASIAZVLO36YV6KQYHEOO"  
    export AWS_SECRET_ACCESS_KEY="vFUAUSXgo/ZGKwsqZ5boLEzF/2hcPNCtmdCF5IhY"  
    export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEOT//////////wEaCXVzLWVhc3QtMSJHMEUCIQCcK33w6fJEeinhc/jYxsDiZFOwVGGyxGlroJZEZkk08gIgTzoaNpxGdyNkQeDCaMLjTy96hyalXg8upmu13Ghw2r8qjQMIvP//////////ARACGgw2NjQzNDE4MzczNTUiDAX9FkccmCxYM6PWMyrhAoXAh3nnUSDhaK+0TX0TvnjLzIglkzLPMwLlvyYwEgz4VmBDxiqW8O+sHUGIBs/9aLWz+so3J+QcyaFYTSnM08MNxNW1CBF+j+7K30f8o3ILULq1qpTewP7dJZCI35FC3epjwfEz5/fyKVAgogpppk3jtLiKtui8xZmZiI+4VAeYo3emi7+jGPbqPSj9ymWTdyWTMjl8h7nfmo/nd21B43JGtE0DGHaSFC0b+ibiJXfqTeP/9iNAUuS7ujcBjoOAb8LJ7VLTUhVqadFQAG1PK9Jc++GrJJwVdP5WIcKmzyFi9SUmmsDu6M+ikN6OgY0IYn9Uicptdwd9o6/ZY7j18G0ppXoyJm+YqSqTzObIzPVHIs9wncwdBIm3I/kXGeE7aOo49FDoaMVHGpkEh2DgdYbFAyKp+Snkc1LAv+8jP50dI5Lgn5kLgYy5nLVf9QgTkPpST3AApgSsWTTxjVJ6VylSMKjnqoAGOqYBPRWeSyEklVH0GEkbPNRebdkA4lzlEcA1RuQRXmKLthtdU9BxV0W832ZUVLWZfgmvb4Z83jYC2rmsovAk3Ph6+bRoomC/iG1A4p6ZV2FgboK+wkXzEZmNh08QOscU5pqkUcOiXBIXnEm/vZ6rcZAVONLxjLE4vS2P8K3l3wUPAWMui4nqypMr8Ee4NGEUM0eN9jkdSmSocnq25WUa20Co4k4ipmdprg=="


Paste the credential environment variables into a shell terminal in the jumphost and then enter the target workshop directory:

    cd NGINX_API_Automation/
    
    ls -la

Customise your workshop name by running:

    ./configure_workshop_name_GNU_Linux.sh

This will become a domain name, so please stick to lower case letters and numeric digits.

This will generate some output like:

    privateKey: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.key.pem') }}"  
    publicCert: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.crt.pem') }}"  
    - "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.issuer.pem') }}"  
    [https://cheese-staging.workshop0001.nginxdemo.net](https://cheese-staging.workshop0001.nginxdemo.net/): {}  
    ref: "/services/environments/staging/certs/workshop0001.nginxdemo.net"  
    [https://cheese-staging.workshop0001.nginxdemo.net](https://cheese-staging.workshop0001.nginxdemo.net/): {}  
    ref: "/services/environments/production/certs/workshop0001.nginxdemo.net"  
    ref: "/services/environments/staging/certs/workshop0001.nginxdemo.net"  
    controller_domain_name: "[controller.workshop0001.nginxdemo.net](http://controller.workshop0001.nginxdemo.net/)"  
    [https://cheese-staging.workshop0001.nginxdemo.net](https://cheese-staging.workshop0001.nginxdemo.net/): {}  
    ref: "/services/environments/staging/certs/workshop0001.nginxdemo.net"  
    controller_domain_name: "[controller.workshop0001.nginxdemo.net](http://controller.workshop0001.nginxdemo.net/)"  
    name:  [workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  
    displayName:  [workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  Wildcard Certificate  
    description: All domains residing in *.[workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  
    privateKey: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.key.pem') }}"  
    publicCert: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.crt.pem') }}"  
    - "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.issuer.pem') }}"  
    [https://cheese-staging.workshop0001.nginxdemo.net](https://cheese-staging.workshop0001.nginxdemo.net/): {}  
    ref: "/services/environments/staging/certs/workshop0001.nginxdemo.net"  
    controller_domain_name: "[controller.workshop0001.nginxdemo.net](http://controller.workshop0001.nginxdemo.net/)"  
    name:  [workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  
    displayName:  [workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  Wildcard Certificate  
    description: All domains residing in *.[workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  
    privateKey: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.key.pem') }}"  
    publicCert: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.crt.pem') }}"  
    - "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.issuer.pem') }}"  
    [https://cheese-staging.workshop0001.nginxdemo.net](https://cheese-staging.workshop0001.nginxdemo.net/): {}  
    ref: "/services/environments/staging/certs/workshop0001.nginxdemo.net"  
    controller_domain_name: "[controller.workshop0001.nginxdemo.net](http://controller.workshop0001.nginxdemo.net/)"  
    name:  [workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  
    displayName:  [workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  Wildcard Certificate  
    description: All domains residing in *.[workshop0001.nginxdemo.net](http://workshop0001.nginxdemo.net/)  
    privateKey: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.key.pem') }}"  
    publicCert: "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.crt.pem') }}"  
    - "{{ lookup('file','~/NGINX_API_Automation/certs/workshop0001.nginxdemo.net.issuer.pem') }}"  
    [https://cheese-staging.workshop0001.nginxdemo.net](https://cheese-staging.workshop0001.nginxdemo.net/): {}  
    ref: "/services/environments/staging/certs/workshop0001.nginxdemo.net"  
    ubuntu@ip-172-31-45-245:~/NGINX_API_Automation$


Now we will generate our TLS certificate for our new customised domain name.

    cd 1_terraform-create-or-refresh-certs/
    
    terraform init; terraform apply --auto-approve

To check your certs have been created, you can look in the newly generated 'certs' directory a level above where you are now.

    cd ../certs
    
    ls -la

Now let us move into chapter 2 where we will create our NGINX Controller and NGINX Plus base machine images (Amazon AMIs)

    cd ../2_packer-build-aws-ami-images/
    
    packer build pack_controllerubuntu+nginxpluscentos7.json

Copy your nginx controller license into the current directory, using the command:

From the machine where you originally built and deployed the ubuntu jumphosts, to ssh onto a jumphost use:

ssh -i ~/.ssh/jumphost-key.pem  ubuntu@ec2-35-178-102-94.eu-west-2.compute.amazonaws.com

To copy the nginx controller license file use the following command. You'll need to substitute the domain name of your 

    scp -i ~/.ssh/jumphost-key.pem /home/owner/.ssh/ngx-certs/controller_license.txt ubuntu@ec2-35-178-102-94.eu-west-2.compute.amazonaws.com :/home/ubuntu/license.txt

This will drop the NGINX Controller license into the ubuntu home folder of the intended jumphost.

Now, we will copy the license into the packer directory:

    cp /home/ubuntu/license.txt .

Run the packer command to build your NGINX PLUS and Controller base AMI machines:

    packer build pack_controllerubuntu+nginxpluscentos7.json

This will build two new AMI machines for you. The first is NGINX PLUS, which will include NGINX App Protect and run Centos 7.x.

The second machine is NGINX Controller (current version 3.12) which will run in Ubuntu 18.04

Now that our two AMIs are created, we can move into Chapter 3: terraform

    cd ../3_terraform-deploy-platform/
    
    terraform init;terraform apply --auto-approve

Terraform will now create a VPC for our Controller Workshop. Within the VPC the following resources are created:

-   Virtual Private Cloud (VPC) - our own private cloud network

-   Subnet - to attach our virtual machines

-   Security Group - to enable access from the outside world and from VM to VM

-   Internet Gateway - so that our VMs can access the internet

-   Routing table - so that internet-bound traffic can be routed

-   Virtual Machines. Four EC2 machines will be created. 3xNGINX PLUS and 1X NGINX Controller

The output should look like:


    Apply complete! Resources: 22 added, 0 changed, 0 destroyed.


Now we can run the workshop exercises. First, cd into the top level workshop directory and open up the workshop exercise web page:

    cd ../
    
    ./begin_exercises_GNU_Linux.sh


You should see the following web page with the links required for the workshop exercises:



![image.png](https://files.slack.com/files-tmb/T025AMM20-F01L93HEEPJ-34d9c7c3ec/image_480.png)


Click on the first link 'Controller Login' and log in with:
 username:  [a.user@f5.com](mailto:a.user@f5.com) 
 password: Password1

One you've logged in, click on the 'Infrastructure' tab on the left and select 'instances'

You should see 3 NGINX PLUS instances. These are running and ready for configuration:

![image.png](https://files.slack.com/files-tmb/T025AMM20-F01K4FA033R-7e287f97a6/image_720.png)


**Chapter 4: Workshop Exercises**


Change directory to chapter 4:

    cd cd 4_ansible-post-deployment-setup/

**Exercise 4.1 Deploy a staging plaform, secured with API key security and a rate limit policy of 1r/s :**
    ansible-playbook deploy_staging_platform.yaml

**Exercise 4.2 Deploy a production platform, secured with JWT Oauth 2 security (Google as the Identity Provider):**

    ansible-playbook deploy_production_platform.yaml

**Exercise 4.3 Deploy NGINX WAF (NAP) against the JuiceShop website**

First, deploy Juiceshop without NAP protecting it:

    ansible-playbook deploy_juiceshop_NO_WAF.yaml

Have fun attacking juice shop. There are multiple possible attack vectors, but a good first attack is to try to login with:
username: '
password: abcd


This should reveal a data breach in the browser log window (F11)

Now, deploy the WAF in front of JuiceShop:


    ansible-playbook deploy_juiceshop_WAF.yaml  

Try the same login attack, and observe that the data breach is now blocked via NGINX App Protect

