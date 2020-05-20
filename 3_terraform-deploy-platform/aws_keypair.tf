resource "aws_key_pair" "controller" {
  key_name   = "controller-key"
  public_key = file ("~/.ssh/controller-key.pub")
}
resource "aws_key_pair" "nginx-server" {
  key_name   = "nginx-server-key"
  public_key = file ("~/.ssh/nginx-server-key.pub")
}
