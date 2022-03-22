provider "aws" {
  region = "us-east-1"
}

module "infracost_instance" {
    source = "../"
   
    vpc_id = "<required>"
    infracost_api_key = "<required, get by infracost register>" 
}
