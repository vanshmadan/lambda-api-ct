resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = aws_api_gateway_rest_api.api-gateway.id
  resource_id = aws_api_gateway_resource.api-gateway-resource.id
  http_method = aws_api_gateway_method.api-gateway-method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code
}
