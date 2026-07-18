terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "virtual_machine" {
  source = "../.."

  name                = "example-vm"
  resource_group_name = "example-rg"
  location            = "eastus"
  size                = "Standard_B2s"

  admin_username       = "azureuser"
  admin_ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgExampleKeyReplaceMe user@host"

  network_interface_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg/providers/Microsoft.Network/networkInterfaces/example-nic"]

  tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

output "vm_id" {
  value = module.virtual_machine.id
}
