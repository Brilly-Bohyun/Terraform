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

# local_file은 테라폼의 local 프로바이더로 파일을 프로비저닝하는데 사용
resource "local_file" "abc" {
  content = "123!"
  filename = "${path.module}/abc.txt"
  # path.module은 실행되는 테라폼 모듈의 파일 시스템 경로
}

data "local_file" "abc" {
  filename = local_file.abc.filename
}

resource "local_file" "def" {
  content = data.local_file.abc.content
  filename = "${path.module}/def.txt"
}