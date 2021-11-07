provider "aws" {
  region = var.region
  shared_credentials_file = var.creds
  profile = "default"
}

resource "aws_instance" "linux-os" {

 ami      = "[IMAGE_ID]"
 instance_type = "t2.micro"
 key_name   = "TerraformKP"
 security_groups = ["sgtf for SSH"]
 tags = {
  Name = "HelloTerraform"
 }



}
