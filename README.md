# pre
Create ssh-key: `ssh-keygen -f mykey`
Change the `terraform-state-a2b634h` s3 bucket name to something random (only the first time).  
This bucket will keep track of the terraform state of my projects.  
Make sure the used AMI id's are valid and in region eu-central-1

commands given to install jenkins
```
terraform init
terraform apply
```

# Jenkins packer demo build
log in met ssh op de jenkins server  
en doe het volgende:
```
su - jenkins
aws configure
# en voer hier je eigen AWS key en secret key op. 
```

Make an jenkins job based on git repo: `https://github.com/srvreeswijk/packer-demo`
And add build step of type `shell` and put the script below in there:
```
ARTIFACT=`packer build -machine-readable packer-demo.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > amivar.tf
aws s3 cp amivar.tf s3://terraform-state-a2b634h/amivar.tf
```

# Jenkins terraform build
This is the second jenkins project. from github repo: https://github.com/srvreeswijk/terraform-course/  
The special part is, the second line, which copies the amivar.tf file from the s3 bucket.  
This way we can start the app, using the previous created AMI. 
```
cd jenkins-packer-demo
aws s3 cp s3://terraform-state-a2b634h/amivar amivar.tf
touch mykey
touch mykey.pub
terraform apply -auto-approve -var APP_INSTANCE_COUNT=1 -target aws_instance.app-instance
```
# jenkins-packer-demo-job2
