# Set some defaults for AWS like region.
#provider "aws" {
# profile = "default"
# region  = "eu-west-2"
#}


# Locate the correct zone from Route53

data "aws_route53_zone" "selected" {
  name         = "nginxdemo.net"
  private_zone = false
}


resource "aws_route53_record" "gateway1" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "gateway1.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.nginx-plus-gateway-1.public_ip ]

}


resource "aws_route53_record" "gateway2" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "gateway2.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.nginx-plus-gateway-2.public_ip ]

}

resource "aws_route53_record" "controller" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "controller.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.nginx-controller.public_ip ]

}

resource "aws_route53_record" "api-backend" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "apibackend.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.api-backend.public_ip ]

}


resource "aws_route53_record" "cheese-staging" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "cheese-staging.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.nginx-plus-gateway-1.public_ip ]

}


resource "aws_route53_record" "cheese-production" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "cheese.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [ aws_instance.nginx-plus-gateway-2.public_ip ]

}


# This gets your IP from a simple HTTP request - note it's V4.
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
