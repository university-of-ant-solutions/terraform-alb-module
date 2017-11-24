variable "security_group_alb" {
  default = "security-group-alb-as1"
}

variable "alb_name" {
  default = "alb-as1"
}

variable "health_check_path" {
  default     = "/"
  description = "The default health check path"
}

variable "deregistration_delay" {
  default     = "30"
  description = "The default deregistration delay"
}

variable "allow_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Specify cird block that is allowd to acces the LoadBalancer"
}

variable "service_name" {
  description = "The name of the service."
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "subnets" {
  type        = "list"
  description = "List of subnet ids to place the loadbalancer in"
}

variable "environment" {}
