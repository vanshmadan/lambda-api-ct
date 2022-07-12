locals {
  product_name = "test"
  env          = var.env
  Owner        = ""
  global_tags = {
    Environment = local.env
    Owner       = local.Owner
    Product     = local.product_name
    Terraform   = true
  }
}
