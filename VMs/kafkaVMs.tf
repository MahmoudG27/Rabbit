# Create three kafka Azure VMs
resource "azurerm_linux_virtual_machine" "kafka-vm" {
  count                           = 3
  name                            = "var.KafkaVM-name-${count.index}"
  resource_group_name             = var.RG-name
  location                        = var.RG-location
  network_interface_ids           = [var.Kafka-PrivateIPs[count.index]]
  size                            = var.KafkaVM-size
  admin_username                  = var.KafkaVM-user
  admin_password                  = var.KafkaVM-user-password
  computer_name                   = "kafka"
  disable_password_authentication = false
  zone                            = count.index + 1

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.KafkaVM-storage-account
    disk_size_gb         = var.KafkaVM-disk-size
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.KafkaVM-sku
    version   = "latest"
  }
}