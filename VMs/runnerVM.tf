resource "azurerm_linux_virtual_machine" "runner-vm" {
  name                            = var.RunnerVM-name
  resource_group_name             = var.RG-name
  location                        = var.RG-location
  size                            = var.RunnerVM-size
  admin_username                  = var.RunnerVM-user
  admin_password                  = var.RunnerVM-user-password
  computer_name                   = "runner"
  disable_password_authentication = false
  zone                            = 1
  network_interface_ids           = var.Runner-PrivateIP

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.RunnerVM-storage-account
    disk_size_gb         = var.RunnerVM-disk-size
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.RunnerVM-sku
    version   = "latest"
  }
}