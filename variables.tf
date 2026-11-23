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

variable "kms_key_rotation_interval" {
  type        = number
  description = "Rotation interval in days (30-365) for the KMS key created by this module. Setting a value enables automatic key rotation. null turns rotation off, also on a key where it was enabled outside of Terraform. (default: null)"
  default     = null
  validation {
    condition     = var.kms_key_rotation_interval == null ? true : var.kms_key_rotation_interval >= 30 && var.kms_key_rotation_interval <= 365
    error_message = "kms_key_rotation_interval not in range 30 <= x <= 365"
  }
}

