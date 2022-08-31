variable "instance_name" {}

variable "zone" {
  default = "asia-southeast1-a"
}

variable "machine_type" {
  default = "e2-micro"
}

variable "tags" {
  type = list(string)
}

variable "image" {}

variable "subnetwork" {
    default = "fita-stage-public-asia-southeast1"
}
