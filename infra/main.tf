resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "barr"
}

resource "aws_s3_bucket" "misconfigured_bucket" {
  bucket = "my-misconfigured-bucket-with-sec-issues"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "terrible_access" {
  bucket = aws_s3_bucket.misconfigured_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_security_group" "test" {
  name        = "test"
  description = "Misconfigured test sg"
  vpc_id      = "vpc-07tststs76c30c02c7"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
