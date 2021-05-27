## Examples lalalal

#### - Customize the default variables
### - In these case, keep in mind, that the aws elb supports only 1 subnet per av
```
terraform apply -var 'subnet_cidrs=["128.0.1.0/24", "128.0.2.0/24"]' -var 'av_zones=["eu-central-1a", "eu-central-1b"]' -auto-approve
```
