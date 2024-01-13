provider "aws" {
  region = "us-east-2"
}

## Defines specific components of the infrastructure
## Physical, virtual or logical resource like ec2, heroku app etc
## Resource type and name
## Whenever you create a new configuration, you need to terra init to download and install the resource
module "lambda_function_container_image" {
  source = "terraform-aws-modules/lambda/aws"

  function_name                 = "cde-timestamp-microservice"
  description                   = "This is the boilerplate code for the Timestamp Microservice project. Instructions for building your project can be found at https://www.freecodecamp.org/learn/apis-and-microservices/apis-and-microservices-projects/timestamp-microservice"
  create_package                = false
  image_uri                     = var.image_uri
  package_type                  = "Image"
  architectures                 = ["x86_64"] # ["arm64"]
  
}