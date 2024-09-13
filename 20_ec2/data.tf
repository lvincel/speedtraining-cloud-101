data "aws_vpc" "speedtraining_vpc" {
  cidr_block = "10.0.0.0/16"
  filter {
    name = "tag:Name"
    values = ["speedtraining"]
  }
}

data "aws_subnet" "public" {
  vpc_id = data.aws_vpc.speedtraining_vpc.id
  filter {
    name = "tag:Name"
    values = ["speedtraining-public"]
  }
}

data "aws_subnet" "private" {
  vpc_id = data.aws_vpc.speedtraining_vpc.id
  filter {
    name = "tag:Name"
    values = ["speedtraining-private"]
  }
}
