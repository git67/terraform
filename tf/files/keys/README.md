## Scope ssh-keys 
#### - Create your or copy your own key here
#### - Name your keys as follows: 
####	- ec2-user/ec2-user.pub 

#### - Example 
```
ssh-keygen -t rsa -b 4096 -N "" -C "ec2-user-cloud-init" -f ./ec2-user
chmod 600 ec2-user && chmod 644 ec2-user.pub
```
