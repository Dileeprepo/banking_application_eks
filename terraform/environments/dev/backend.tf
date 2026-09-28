# Remote state in S3 with native lockfile locking (Terraform >= 1.10 — no DynamoDB).
#
# Only the S3 bucket must exist first (bootstrap once, out of band). `use_lockfile`
# makes the S3 backend hold the lock as a `.tflock` object via conditional writes.
# For offline validation we run `terraform init -backend=false`, so this block is
# inert until you configure and init with a real backend.
terraform {
  backend "s3" {
    bucket       = "dileep-banking-tfstate-2026" # create once, then set here
    key          = "dev/networking.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
