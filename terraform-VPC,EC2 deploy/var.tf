variable "vpc_name" {
  type    = string
  default = "gfg-vpc"
}

variable "availability_zone" {
  type = string
  default = "ap-south-1a"
}

variable "Subnet1Name" {
  type = string
  default = "gfg-subnet1"  
}

variable "InternetGatewayName" {
  type = string
  default = "gfgigw"  
}

variable "amiID" {
  type = string
  default = "ami-0144277607031eca2"  
}

variable "instanceType" {
  type = string
  default = "t2.micro"  
}

variable "mapIPaddressOnLaunch" {
  type = bool
  default = true
}

variable "allowPorts" {
  type = list
  default = [80, 8080, 90, 82, 9090, 3000, 83]
}