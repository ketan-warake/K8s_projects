provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://35.88.247.19/8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "5e9bddcf-ba40-6eb0-56e7-b9b506ebbfd4"
      secret_id = "5c466243-baa7-c8e1-4757-42364febdcd6"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-04dd23e62ed049936"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
