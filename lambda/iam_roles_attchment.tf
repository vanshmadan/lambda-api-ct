####################################################################################
####                                                                            ####
####                                                                            ####
####                          Role Attachment Policy                            ####
####                                                                            ####
####                                                                            ####
####################################################################################

module "lambda_policy_attachment" {
  source                  = "../modules/iam_roles_attachment"
  role_name               =  module.s3_lambda_us_east_1.role_name
  custom_role_policy_arns = [module.s3_policy_lambda.arn] 
}

module "lambda_api_gateway_attachment" {
  source                  = "../modules/iam_roles_attachment"
  role_name               =  module.s3_lambda_api_gateway_us_east_1.role_name
  custom_role_policy_arns = [module.api_gateway_policy_lambda.arn]
}
