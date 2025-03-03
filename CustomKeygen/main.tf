provider "aws" {
  region = "ap-south-1"
}
resource "tls_private_key" "tofu_key" {
  algorithm = "RSA"
  rsa_bits = 2047
}
resource "local_file" "Privatekeytofu" {
  content = tls_private_key.tofu_key.private_key_pem
  filename = "TofuKey.pem"

}
resource "aws_key_pair" "localKey" {
  key_name = "tofuKey"
  public_key = tls_private_key.tofu_key.public_key_openssh
}