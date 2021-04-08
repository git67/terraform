## Scope (default)
#### - VPC with 2 subnet (pub/priv)
#### - 1 ec2 instance in every subnet
#### - Allow public access through tcp/22, tcp/8080
#### - Allow private access through tcp/22, icmp

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
git clone --branch features/ec2_pub_priv https://github.com/git67/terraform.git ./ec2_pub_priv
cd ./ec2_pub_priv
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

#### - Probe your terraform code
```
terraform validate
terraform plan
```

#### - Run terraform without any interaction, build your environment@aws
```
terraform apply -auto-approve
```

#### - Have a look for public-ip's of ec2-instances
```
...
public_ip = [
...
```

#### - Probe ssh login into an instance (or use the public key given in vars_stack.tf)
```
ssh ec2-user@<public_ip>
```


#### - Destroy your environment@aws
```
terraform destroy -auto-approve
```

