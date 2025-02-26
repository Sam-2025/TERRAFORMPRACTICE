provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

variable "regions" {
  type = map(string)
  default = {
    virginia = "us-east-1"
    mumbai   = "ap-south-1"
  }
}

resource "aws_s3_bucket" "multi_region" {
  for_each = var.regions  

  bucket = "fardeen123-${each.key}-${each.value}"  # ✅ Unique bucket name  

  provider = aws.virginia  # ✅ Placeholder - Updated dynamically in a module (see below)

  tags = {
    Name        = "fardeen123-${each.key}"
    Environment = "Dev"
    Region      = each.value
  }
}
