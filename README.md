## terraform

#### The following steps are necessary:
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

#### - Probe connection to aws clous
```
aws ec2 describe-regions --profile <your-profile-name>
```

#### - you have to pull these repository
```
git clone --branch features/ec2_pub_priv https://github.com/git67/terraform.git ./ec2_pub_priv
cd ./ec2_pub_priv
```

#### - In certain circumstances, set your needed data in vars_aws.tf (profile/region)
###### - variable "profile" -> aws cli profile
#### - vars_stack.tf (instance_count)
###### - variable "instance_count"  -> count ec2 instances
```
vim vars_aws.tf
vim vars_stack.tf
```
#### - Initialisation of terraform environment
```
terraform init
```

#### - Probe your terraform code
```
terraform validate
terraform plan
```

#### - Run terraform without any interaction
```
terraform apply -auto-approve
```

#### - Have a look for public-ip's of ec2-instances
```
...
public_ip = [
...
```

#### - Probe ssh login into an instance
```
ssh -i ~/.ssh/id_rsa ec2-user@<public_ip>
```


#### - Undeployment
```
terraform destroy -auto-approve
```

