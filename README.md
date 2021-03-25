## terraform

####The following steps are necessary:
###- Install terrafom && aws-cli && ssh-keygen (if needed)
###- Check terraform && aws-cli

```
terraform version
aws --version

```

###- probe your aws secrets
```
# ls ~/.aws
```

- list configured profile
# aws configure list --profile <your-profile-name>

- probe connection to aws clous
# aws ec2 describe-regions --profile <your-profile-name>

- In certain circumstances, set your needed data in variables.tf (profile/region/count)

- Deployment
- Initalisiation of terraform environment
# terraform init

- Probe your terraform code
# terraform plan

- Run terraform without any interaction
# terraform apply -auto-approve
…


- Have a look for public-ip's of ec2-instances
...
public_ip = [
  "3.121.208.78",
  "18.184.134.11",
  "54.93.103.10",
  "3.120.134.9",
  "52.58.253.216",
]
...


- Probe ssh login into an instance
# ssh -i ~/.ssh/id_rsa ec2-user@<public_ip>


- UnDeployment
# terraform destroy -auto-approve

