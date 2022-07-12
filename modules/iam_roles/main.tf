resource "aws_iam_role" "iam_role" {
  name                  = var.name
  assume_role_policy    = var.assume_role_policy
  force_detach_policies = true
  tags                  = var.tags
  max_session_duration  = var.max_session_duration
  lifecycle {
    create_before_destroy = true
  }
}
