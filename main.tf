provider "aws" {
  region = "us-east-1"
}
resource "random_id" "id" {
  byte_length = 8
}

resource "aws_s3_bucket" "rezaday_portfolio" {
  bucket        = "rezaday-portfolio-${random_id.id.hex}"
  force_destroy = true
  tags = {
    Name        = "Rezaday Portfolio"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.rezaday_portfolio.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.rezaday_portfolio.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.rezaday_portfolio.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.rezaday_portfolio.id
  policy = data.aws_iam_policy_document.s3_policy.json

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

resource "aws_s3_object" "site_files" {
  for_each = {
    "index.html" = "text/html"
  }

  bucket       = aws_s3_bucket.rezaday_portfolio.id
  key          = each.key
  source       = "./${each.key}"
  content_type = each.value
}

resource "aws_s3_object" "image" {
  bucket       = aws_s3_bucket.rezaday_portfolio.id
  key          = "founder.jpg"
  source       = "./founder.jpg"
  content_type = "image/jpeg"
}
