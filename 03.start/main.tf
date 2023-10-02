terraform {
  required_version = ">= 1.0.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.0.0"
    }
  }
  backend "local" {
    path = "state/terrafrom.tfstate"
  }
}

variable "my_password" {
  default = "password"
  sensitive = true
}

variable "my_var" {
  default = "var2"
}

variable "prefix" {
  default = "hello"
}

locals {
  name = "terraform"
}

variable "names" {
  type = list(string)
  default = [ "a","b","c" ]
}

# local_file은 테라폼의 local 프로바이더로 파일을 프로비저닝하는데 사용
resource "local_file" "abc" {
  for_each = {
    a = "content a"
    b = "content b"
  }
  content = each.value
  filename = "${path.module}/${each.key}.txt"
  # path.module은 실행되는 테라폼 모듈의 파일 시스템 경로
}

# resource "aws_instance" "web" {
#   ami = "ami-08d0e13d30abe253"
#   instance_type = "t3.micro"

#   tags = {
#     name = "HelloWorld"
#   }
# }