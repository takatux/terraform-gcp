variable "instance_name" {}

variable "zone" {
  default = "asia-southeast1-a"
}

variable "machine_type" {
  default = "e2-highcpu-2"
}

variable "tags" {
  type = list(string)
}

variable "image" {}

variable "subnetwork" {
    default = "fita-stage-public-asia-southeast1"
}

variable "network" {
    default = "fita-stage-vpc"
}