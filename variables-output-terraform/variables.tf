variable "region" {
  default = "us-east-1"
}
variable "ubuntu" {
  default = "ami-020cba7c55df1f615"
}
variable "instance-type" {
  default = "t2.micro"
}

variable "key-name" {
  default = "Terraformkey"
}

variable "cidr-block" {
  default = "10.1.0.0/16"
  type    = string
}

variable "public-subent-01" {
  default = "10.1.1.0/24"
  type    = string
}
