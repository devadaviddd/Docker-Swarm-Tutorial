variable "availability_zone" {
  description = "Availability zone of resources"
  type        = string
}

variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
}

variable "key_pair_name" {
  description = "key_pair_name"
  type        = string
}

variable "public_key" {
  description = "public_key"
  type        = string
}