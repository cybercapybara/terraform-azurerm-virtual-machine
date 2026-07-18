variable "name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "Azure region in which to create the virtual machine."
  type        = string
}

variable "size" {
  description = "SKU size of the virtual machine, e.g. Standard_B2s."
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Administrator username for the virtual machine."
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "OpenSSH-formatted public key granted access to the admin account."
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs to attach to the virtual machine. The first is primary."
  type        = list(string)

  validation {
    condition     = length(var.network_interface_ids) > 0
    error_message = "At least one network interface ID must be provided."
  }
}

variable "os_disk_caching" {
  description = "Caching mode of the OS disk. One of None, ReadOnly or ReadWrite."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "Storage account type of the OS disk, e.g. Standard_LRS or Premium_LRS."
  type        = string
  default     = "Premium_LRS"
}

variable "source_image_reference" {
  description = "Marketplace image reference used to provision the virtual machine."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

variable "tags" {
  description = "Map of tags applied to the virtual machine."
  type        = map(string)
  default     = {}
}
