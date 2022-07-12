resource "aws_api_gateway_method" "api-gateway-method" {
  rest_api_id   = aws_api_gateway_rest_api.api-gateway.id
  resource_id   = aws_api_gateway_resource.api-gateway-resource.id
  http_method   = "POST"
  authorization    = "NONE"
}

