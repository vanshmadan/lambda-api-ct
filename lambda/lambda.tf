#####################################################################################
#####                                                                            ####
#####                                                                            ####
#####                       Lambda function                                      ####
#####                                                                            ####
#####                                                                            ####
#####################################################################################
module "lambda_fnc_s3upload" {
  source                      = "../modules/lambda-function"
  product_name                = "test"
  env                         = "env"
  runtime                     = "python3.6"
  name                        = "lambda-s3upload"
  lambda_function_name        = "lambda-s3upload"
  lambda_function_description = "Lambda function"
  lambda_handler              = "lambda_function.lambda_handler"
  role                        = module.s3_lambda_us_east_1.role_arn
  env_variables = {}
  path_dummy_code             = "lambda_dummy_code.zip"
  lambda_s3_bucket            = module.s3_ci_cd_for_serverless_lambda.bucket_id
  tags               = {
                      "${var.env_key}"            = var.env
                    }
}
