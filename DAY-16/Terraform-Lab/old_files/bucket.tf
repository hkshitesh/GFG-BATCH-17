resource "aws_s3_bucket" "gfg-s3" {
  bucket = "hkshitesh-gfg-bucket"

  tags = {
    Name        = "My bucket"    
  }
}