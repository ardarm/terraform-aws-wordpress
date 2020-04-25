resource "aws_kms_key" "state_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
}

resource "aws_s3_bucket" "remote_state" {
  bucket = "wordpress-remote-state-zxcvbnm"
  acl    = "private"
  region = "ap-southeast-1"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "terraform remote state"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.state_key.id}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

output "bucket_arn" {
  value       = "${aws_s3_bucket.remote_state.arn}"
  description = "ARN of remote state bucket"
}

output "bucket_id" {
  value       = "${aws_s3_bucket.remote_state.id}"
  description = "ID of remote state bucket"
}
