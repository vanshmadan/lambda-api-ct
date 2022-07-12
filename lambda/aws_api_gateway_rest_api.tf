resource "aws_api_gateway_rest_api" "api-gateway" {
  api_key_source               = "HEADER"
  endpoint_configuration {
    types = ["EDGE"]
  }
  name                     = "jsonfileupload"
}
