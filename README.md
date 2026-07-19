# terraform-azurerm-virtual-machine

Terraform module that manages an [Azure](https://azure.microsoft.com/) Linux
virtual machine. It provisions a single VM from a marketplace image with
SSH-key authentication (password login disabled) and a managed OS disk, and
attaches one or more pre-existing network interfaces.

## Usage

```hcl
module "virtual_machine" {
  source = "github.com/moveeeax/terraform-azurerm-virtual-machine"

  name                = "app-vm"
  resource_group_name = "prod-rg"
  location            = "eastus"
  size                = "Standard_D2s_v5"

  admin_username       = "azureuser"
  admin_ssh_public_key = file("~/.ssh/id_rsa.pub")

  network_interface_ids = [module.nic.id]

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| azurerm   | >= 3.0   |

## Inputs

| Name                           | Description                                                              | Type           | Default          | Required |
|--------------------------------|--------------------------------------------------------------------------|----------------|------------------|:--------:|
| `name`                         | Name of the virtual machine.                                             | `string`       | n/a              |   yes    |
| `resource_group_name`          | Name of the resource group in which to create the virtual machine.       | `string`       | n/a              |   yes    |
| `location`                     | Azure region in which to create the virtual machine.                     | `string`       | n/a              |   yes    |
| `size`                         | SKU size of the virtual machine.                                         | `string`       | `"Standard_B2s"` |    no    |
| `admin_username`               | Administrator username for the virtual machine.                          | `string`       | `"azureuser"`    |    no    |
| `admin_ssh_public_key`         | OpenSSH-formatted public key granted access to the admin account.        | `string`       | n/a              |   yes    |
| `network_interface_ids`        | List of network interface IDs to attach. The first is primary.           | `list(string)` | n/a              |   yes    |
| `os_disk_caching`              | Caching mode of the OS disk.                                             | `string`       | `"ReadWrite"`    |    no    |
| `os_disk_storage_account_type` | Storage account type of the OS disk.                                     | `string`       | `"Premium_LRS"`  |    no    |
| `source_image_reference`       | Marketplace image reference used to provision the VM.                    | `object`       | Ubuntu 22.04 LTS |    no    |
| `tags`                         | Map of tags applied to the virtual machine.                              | `map(string)`  | `{}`             |    no    |

## Outputs

| Name                 | Description                                              |
|----------------------|----------------------------------------------------------|
| `id`                 | ID of the virtual machine.                               |
| `name`               | Name of the virtual machine.                             |
| `private_ip_address` | Primary private IP address of the virtual machine.       |
| `public_ip_address`  | Primary public IP address of the virtual machine, if any.|

## License

[MIT](LICENSE)
