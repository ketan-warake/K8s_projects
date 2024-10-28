provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
}


terraform {
  required_providers {
    mycloud = {
      source  = "mycorp/mycloud"
      version = "~> 1.0"
    }
  }
}

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
  # Provider functions require Terraform 1.8 and later.
  required_version = ">= 0.15.0"
}

output "debug" {
  value = "Good luck! :)"




resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}
