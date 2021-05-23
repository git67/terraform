## Scope ssh-keys 
#### - Create your or copy your own key here
#### - Name your keys as follows: 
####	- ansible/ansible.pub 

#### - Example 
```
ssh-keygen -t rsa -b 4096 -N "" -C "ansible-system-configuration" -f ./ansible
chmod 600 ansible && chmod 644 ansible.pub
```
