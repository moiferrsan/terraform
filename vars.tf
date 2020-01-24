variable "vpc_cidr_block" {
  description = "Range de Ips"
  default     = "172.17.0.0/16"
}

variable "az_count" {
  default     = "2"
}
