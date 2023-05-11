terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rhb-bank-salikz"
    workspaces {
     # name = "sit-two"
      prefix = "my-app-"
    }
  }
}