####################################################################################
####                                                                            ####
####                                                                            ####
####                      Lambda S3 Policy                                      ###
####                                                                            ####
####                                                                            ####
####################################################################################



data "aws_iam_policy_document" "lambda_s3_policy" {
    statement {
        effect = "Allow"
        actions = [
            "s3:ListBucket"
        ]
        resources = [
                "${module.s3_ci_cd_for_serverless_lambda.bucket_arn}"
            ]
    }
    statement {
        effect = "Allow"
        actions = [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
        ]
        resources = [
                "${module.s3_ci_cd_for_serverless_lambda.bucket_arn}/*",
                ]
    }
}

module "s3_policy_lambda" {

  source              =  "../modules/iam_policy"
  name                = "lambda-deploy"
  #tags                = merge(local.global_tags, { "Creator" : "" })
  iam_policy_doc_json = data.aws_iam_policy_document.lambda_s3_policy.json
}

####################################################################################
####                                                                            ####
####                                                                            ####
####                      Lambda Invoke Policy  api gateway                      ###
####                                                                            ####
####                                                                            ####
####################################################################################    
    
data "aws_iam_policy_document" "lambda_invoke_policy" {
    statement {
        effect = "Allow"
        actions = [
            "s3:ListBucket"
        ]
        resources = [
                "${module.s3_ci_cd_for_serverless_lambda.bucket_arn}"
            ]
    }
    statement {
        effect = "Allow"
        actions = [
             "lambda:InvokeFunction"
        ]
        resources = [
                "*",
                ]
    }
}

module "api_gateway_policy_lambda" {

  source              =  "../modules/iam_policy"
  name                = "api-gateway-lambda-deploy"
  #tags                = merge(local.global_tags, { "Creator" : "" })
  iam_policy_doc_json = data.aws_iam_policy_document.lambda_invoke_policy.json
}
