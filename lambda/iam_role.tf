data "aws_iam_policy_document" "assume_ec2_role_policy" {
  statement {
    sid = "assumePolicy"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    effect = "Allow"
  }
}

module "s3_lambda_us_east_1" {
  source             = "../modules/iam_roles"
  assume_role_policy = data.aws_iam_policy_document.assume_ec2_role_policy.json
  name               = "lambda-${var.env}"
  tags               = merge(local.global_tags, { "Creator" : "vanshkumar@lambdatest.com" })
}


data "aws_iam_policy_document" "assume_lambda_role_policy" {
  statement {
    sid = "assumePolicy"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com","apigateway.amazonaws.com"]
    }
    effect = "Allow"
  }
}

module "s3_lambda_api_gateway_us_east_1" {
  source             = "../modules/iam_roles"
  assume_role_policy = data.aws_iam_policy_document.assume_lambda_role_policy.json
  name               = "api-gateway-execution-${var.env}"
  tags               = merge(local.global_tags, { "Creator" : "vanshkumar@lambdatest.com" })
}

