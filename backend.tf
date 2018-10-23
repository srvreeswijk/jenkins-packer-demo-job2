terraform {
  backend "s3" {
    bucket = "terraform-state-a2b634h"
    key    = "jenkins/packer-demo-job2.tfstate"
    region = "eu-central-1"
  }
}

