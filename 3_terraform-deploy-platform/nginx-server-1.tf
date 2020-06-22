resource "aws_instance" "nginx-plus-gateway-1" {
  ami                         = data.aws_ami.ngx_plus.id # eu-west-2
  instance_type               = "t2.medium"
  key_name                    = "nginx-server-key"
  security_groups             = [aws_security_group.nginx-web-facing.id]
  subnet_id                   = aws_subnet.main.id
  private_ip                  = "10.0.1.20"
  
  tags = {
    Name = "nginx-plus-gateway-1"
  }

  
  
  
}



resource "null_resource" "gateway-1-join-controller" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    trigger1 = aws_route53_record.gateway1.ttl
  }
  
  provisioner "remote-exec" {
  
    connection {
    type     = "ssh"
    user     = "ubuntu"
	private_key = file("~/.ssh/nginx-server-key.pem")
    host     = aws_instance.nginx-plus-gateway-1.public_ip
  }
  
        inline = [
		"#until sudo apt-get update -y; do sleep 10; done",
		"#until sudo apt-get upgrade -y; do sleep 10; done",
		"sudo sh -c 'echo -n ${ data.local_file.foo.content } >>/etc/hosts'",
		"sudo sh -c 'echo \" controller.nginxdemo.net\" >>/etc/hosts'",
		"ansible-playbook connect_nginx_server_to_controller.yaml",

    ]
  }

}