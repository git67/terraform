## Scope (default)
#### - VPC with 3 subnet(s) in separate av zones
#### - 1 or more ec2 instance in every subnet
#### - Allow public access through tcp/22, tcp/8080
#### - Configure ELB over all instances (http:8080)
#### - Add simple shell script via cloud-init


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

#### - Set aws profile data in variables.tf, if it is not the default profile
#### - Customize your stack environment (count of ec2 instanzes, cidr's, ...) or leave the default's
```
vim variables.tf
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
#### - for example add 5 additional instances to the stack
```
# terraform apply -var "add_instance_count=5" -auto-approve
```

#### - Have a look for public-ip's of ec2-instances and the fqdn of the elb
```
...
Outputs:

elb_fqdn = "..."
pub_ec2_public_ip = [
...
]
...
```

#### - Probe ssh login into an instance (or use the public key given in variables.tf)
```
ssh ec2-user@<public_ip>
```


#### - Destroy your environment@aws
```
terraform destroy -auto-approve
```

