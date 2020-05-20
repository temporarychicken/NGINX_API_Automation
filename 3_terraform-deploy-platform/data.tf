# Fetch AWS NGINX Plus AMI identifiers
data "aws_ami" "ngx_plus" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "ngx-plus",
    ]
  }
}
# Fetch AWS NGINX Controller AMI identifiers
data "aws_ami" "ngx_controller" {
  most_recent = true
  owners      = ["self"]
  filter {
    name = "tag:Name"
    values = [
      "nginx-controller",
    ]
  }
}
