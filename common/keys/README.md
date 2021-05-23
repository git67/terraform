## Scope ssh-keys 
#### - Create your or copy your own key here
#### - Name your keys as follows: 
####	- ec2-user/ec2-user.pub 
####	- ansible/ansible.pub 

#### - Example for create the keys
```
ssh-keygen -t rsa -b 4096 -N "" -C "ansible-system-configuration" -f ./ansible
chmod 600 ansible && chmod 644 ansible.pub

ssh-keygen -t rsa -b 4096 -N "" -C "ec2-user-cloud-init" -f ./ec2-user
chmod 600 ec2-user && chmod 644 ec2-user.pub
```
