data "aws_ami" "amzlinux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "ec2_public" {
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.public.id
  ami = data.aws_ami.amzlinux.id
  tags = {
    Name = "ec2-public"
  }
}

resource "aws_ec2_instance_connect_endpoint" "this" {
  subnet_id = data.aws_subnet.public.id
}

resource "aws_instance" "ec2_private" {
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.private.id
  ami = data.aws_ami.amzlinux.id
  tags = {
    Name = "ec2-private"
  }
}

