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
git clone --branch features/modules https://github.com/git67/terraform.git ./terraform
cd ./terraform
```

#### - In certain circumstances, set your needed data in variables.tf (profile/region/count)
##### - variable "profile" -> aws cli profile
##### - variable "instance_count"  -> count ec2 instances
```
vim variables.tf
```
#### - Initialisation of terraform environment
```
terraform init
```

#### - Probe your terraform code
```
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
  "3.121.208.78",
  "18.184.134.11",
  "54.93.103.10",
  "3.120.134.9",
  "52.58.253.216",
]
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

