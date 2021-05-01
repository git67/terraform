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
git clone --branch features/minimal https://github.com/git67/terraform.git ./miminal
cd ./minimal
```

###### - Place your profile name into main.tf:
```
//aws
provider "aws" {
  profile = "<your_profile>"     <- here
  region  = "eu-central-1"
}
…
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

#### - Remove your deployment
```
terraform destroy -auto-approve
```

