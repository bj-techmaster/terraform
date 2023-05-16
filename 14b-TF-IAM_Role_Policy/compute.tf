// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
data "aws_ami" "server_ami" {
  most_recent = true

  // owners = ["099720109477"]
  owners = ["amazon"]

  filter {
      name = "owner-alias"
      values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*-x86_64-gp2"]
    //values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "terraform_test_ec2" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id
  key_name      = var.instance_key_name
  user_data     = templatefile("userdata.tpl", {})
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "terraform_test_ec2"
  }
  vpc_security_group_ids = [aws_security_group.terraform_test_sg.id]
  subnet_id              = aws_subnet.terraform_public_test_subnet[count.index].id

  root_block_device {
    volume_size = var.vol_size
  }
}