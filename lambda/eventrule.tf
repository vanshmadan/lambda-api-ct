module "createrule" {
    source                  = "../modules/eventbridge"
    rule_name               = "object_rule-${var.env}"
    sns_name                = "sns_name-${var.env}" 
    protocol                = "email"
    email_name              = "vanshkumarmadan@gmail.com"
}
