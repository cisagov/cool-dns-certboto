# This is the "default" provider that is used to create resources
# inside the DNS account
provider "aws" {
  profile = "cool-dns-provisionaccount"
  region  = var.aws_region
}
