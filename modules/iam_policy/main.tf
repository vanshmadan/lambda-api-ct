resource "aws_iam_policy" "iam_policy" {
  name          = var.name
  policy        = var.iam_policy_doc_json
}
