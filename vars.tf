variable "AWS_REGION" {
  default = "eu-central-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    eu-central-1 = "ami-0dd0be70cc0d493b7"
  }
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
# jenkins en terraform latest versions as of 21-10-2018
variable "JENKINS_VERSION" {
  default = "2.138.2"
}
variable "TERRAFORM_VERSION" {
  default = "0.11.9"
}
variable "PACKER_VERSION" {
  default = "1.3.1"
}

variable "APP_INSTANCE_COUNT" {
  default = "0"
}
