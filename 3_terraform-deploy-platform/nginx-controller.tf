data "local_file" "foo" {
    filename = "private_ip.txt"
}

resource "aws_instance" "nginx-controller" {
  ami                         = data.aws_ami.ngx_controller.id # eu-west-2
  instance_type               = "c5.2xlarge"
  key_name                    = "controller-key"
  security_groups             = [aws_security_group.nginx-web-facing.id]
  subnet_id                   = aws_subnet.main.id
  private_ip                  = data.local_file.foo.content

 
  tags = {
    Name = "nginx-controller"
  }

}





#resource "null_resource" "nginx-controller" {
  # Changes to any instance of the cluster requires re-provisioning
#  triggers = {
#    the_trigger     =  aws_instance.nginx-controller.public_ip
#    another_trigger =	aws_route53_record.controller.zone_id
#  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
#  connection {
#    host = "${element(aws_instance.nginx-controller.*.public_ip, 0)}"
#  }

#  provisioner "remote-exec" {
#  
#    connection {
#    type     = "ssh"
#    user     = "ubuntu"
#	private_key = file("~/.ssh/controller-key.pem")
#    host     = aws_instance.nginx-controller.public_ip
#  }
#  
#        inline = [
#  	    "sh ./install-controller.sh"
#    ]
#  }

#}
