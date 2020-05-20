resource "aws_instance" "api-backend" {
  ami                         = data.aws_ami.ngx_plus.id # eu-west-2
  instance_type               = "t2.medium"
  key_name                    = "nginx-server-key"
  security_groups             = [aws_security_group.nginx-web-facing.id]
  subnet_id                   = aws_subnet.main.id
  private_ip                  = "10.0.1.90"


  tags = {
    Name = "nginx-api-backend"
  }

}

resource "null_resource" "api-backend-join-controller" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    trigger1 = aws_route53_record.api-backend.ttl
  }
  
  provisioner "remote-exec" {
  
    connection {
    type     = "ssh"
    user     = "ubuntu"
	private_key = file("~/.ssh/nginx-server-key.pem")
    host     = aws_instance.api-backend.public_ip
  }
  
        inline = [
		"until sudo apt-get update -y; do sleep 10; done",
		"until sudo apt-get upgrade -y; do sleep 10; done",
		"sudo sh -c 'echo -n ${ data.local_file.foo.content } >>/etc/hosts'",
		"sudo sh -c 'echo \" controller.nginxdemo.net\" >>/etc/hosts'",
		"ansible-playbook connect_nginx_server_to_controller.yaml",

    ]
  }
  
}
