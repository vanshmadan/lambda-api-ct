resource "aws_cloudwatch_event_rule" "object_create" {
  name        = "${var.rule_name}"
  description = "Object creation capured"

  event_pattern = <<EOF
{
  "detail-type": [
    "Object Created"
  ],
  "reason" : [
      "PutObject"
  ]
}
EOF
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.object_create.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.notif.arn
}

resource "aws_sns_topic" "notif" {
  name = "${var.sns_name}"
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.notif.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.notif.arn]
  }
}
resource "aws_sns_topic_subscription" "mail" {
  topic_arn = aws_sns_topic.notif.arn
  protocol  = "${var.protocol}"
  endpoint  = "${var.email_name}"
}
