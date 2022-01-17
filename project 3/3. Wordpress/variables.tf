##-----------------------------------------------------------##
# Variable declaration for autoscaling group
##-----------------------------------------------------------##

variable "use_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}

variable "min_size" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 2
}