resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-a2b634h"
    lifecycle {
      prevent_destroy = true
     }
    acl = "private"

    tags {
        Name = "Terraform state"
    }
}
