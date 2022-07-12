data "aws_caller_identity" "current" {}
resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  acl    = var.acl
  cors_rule {
    allowed_headers = var.allowed_headers
    allowed_origins = var.allowed_origins
    allowed_methods = var.allowed_methods
    max_age_seconds = var.max_age_seconds
  }

  versioning {
    enabled = var.enable_versioning
  }

  acceleration_status = var.acceleration_status  
}

resource "aws_s3_bucket_policy" "policy" {
  count = var.create_public_bucket ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "sid1",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject"
      "Resource": "${aws_s3_bucket.bucket.arn}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_public_access_block" "bucket_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
}

resource "aws_cloudtrail" "cloudtrail_event" {
  name                          = "trail-events"
  s3_bucket_name                = aws_s3_bucket.bucket.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
  depends_on = ["aws_s3_bucket_policy.policy_another"]
}

resource "aws_s3_bucket_policy" "policy_another" {
  bucket = aws_s3_bucket.bucket.id
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${aws_s3_bucket.bucket.arn}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.bucket.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
