variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "Environment name, e.g. prod."
  type        = string
}

variable "owner" {
  description = "Owner tag value."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "southafricanorth"

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Location must be southafricanorth."
  }
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "sku_name" {
  description = "SKU of the NAT Gateway."
  type        = string
  default     = "Standard"
}

variable "public_ip_id" {
  description = "ID of the public IP to attach to the NAT Gateway."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to associate the NAT Gateway with."
  type        = string
}