## Scope (default)
#### - VPC with 2 or more public  subnet(s)
#### - 1 or more ec2 instance in every subnet
#### - Allow public access through tcp/22, tcp/8080
#### - Configure ELB
#### - Add simple shell hook, simple !


## The following steps are necessary:
#### - Install terrafom && aws-cli && ssh-keygen (if needed)
#### - Check terraform && aws-cli

```
terraform version
aws --version
```

#### - Probe your aws secrets
```
ls ~/.aws
```

#### - List configured profile
```
aws configure list --profile <your-profile-name>
```

#### - Probe connection to aws cloud
```
aws ec2 describe-regions --profile <your-profile-name>
```

#### - You have to pull the repository from github
```
git clone --branch features/ha_web_elb https://github.com/git67/terraform.git ./ha_web_elb
cd ./ha_web_elb
. .env
```

#### - Set aws profile data in vars_aws.tf, if it is not the default profile
```
vim vars_aws.tf
```
#### - Customize your stack environment (count of ec2 instanzes, cidr's, ...) or leave the default's
```
vim vars_stack.tf
```
#### -Run the initialisation of terraform environment
```
terraform init
```

#### - Probe your terraform code now
```
terraform validate
terraform plan
```

#### - Run terraform without any interaction, build your environment@aws
```
terraform apply -auto-approve
```

#### - or run terraform without any interaction and some customization to build your environment@aws
```
terraform apply -auto-approve -var 'pub_instance_count=3' -var 'priv_instance_count=1'
```

#### - Have a look for public-ip's of ec2-instances
```
...
public_ip = [
...
```

#### - For further processing a host file with the created instances is stored in ./etc
```
less ./etc/hosts
```

#### - Probe ssh login into an instance (or use the public key given in vars_stack.tf)
```
ssh ec2-user@<public_ip>
```


#### - Destroy your environment@aws
```
terraform destroy -auto-approve
```

