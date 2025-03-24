variable "volume_names" {
  type = list(string)
}

variable "tags" {
  type        = map(string)
  description = "Common tag set for project resources"
  default     = {}
}

variable "spec" {
  default = {
    size        = 20
    volume_type = "SSD"
    device_type = "SCSI"
  }
  type = object({
    size        = number
    volume_type = string
    device_type = string
  })
}

variable "availability_zones" {
  default = ["eu-de-01"]
  type    = list(string)
}

variable "kms_key_prefix" {
  type = string
}

