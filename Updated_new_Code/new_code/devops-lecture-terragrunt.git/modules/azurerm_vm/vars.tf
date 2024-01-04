variable "location" {
  type        = string
  description = "The azure region where the Resource Group should exist"
  default     = "West Europe"
}

variable "name" {
  type        = string
  description = "The name which should be used for this Resource Group."
  default     = "RG"
}

variable "vmname" {
  type        = string
  description = "The name which should be used for this Resource Group."
  default     = "vmterrgrun789"
}