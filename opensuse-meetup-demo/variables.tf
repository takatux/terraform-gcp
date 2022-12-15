variable "project_id" {
  type = string
  default = "lunar-geography-261201"
}

variable "region" {
  type = string
  default = "asia-southeast1"
}

variable "zone" {
  type = string
  default = "asia-southeast1-a"
}

variable "company" {
  default = "opensuseid"
}

variable "env" {
  default = "stage"
}

#variable "private_cidr_range" {}

#variable "public_cidr_range" {}

variable "tags" {
  type = list(string)
  default = [ "web", "ssh" ]
}