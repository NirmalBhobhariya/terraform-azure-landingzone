rg_info = {
  "rg1" = {
    "name"     = "sales_rg"
    "location" = "east us"
  }
}
vnet_info = {
  vnet1 = {
    "name"          = "vnet_dev"
    "address_space" = ["10.0.0.0/16"]
    "rg_key"        = "rg1"
  }
}
subnet_info = {
  "subnet_linux" = {
    "name"             = "linux_vm_subnet"
    "address_prefixes" = ["10.0.1.0/24"]
    "rg_key"           = "rg1"
    "vnet_key"         = "vnet1"
  }
  "subnet_window" = {
    "name"             = "window_vm_subnet"
    "address_prefixes" = ["10.0.2.0/24"]
    "rg_key"           = "rg1"
    "vnet_key"         = "vnet1"
  }
  "subnet_bastion" = {
    "name"             = "AzureBastionSubnet"
    "address_prefixes" = ["10.0.3.0/24"]
    "rg_key"           = "rg1"
    "vnet_key"         = "vnet1"
  }
}
nic_info = {
  "nic1" = {
    "name"   = "nic-dev-01"
    "rg_key" = "rg1"

    "ip_configurations" = [
      {
        "name"                          = "ipconfig1"
        "subnet_key"                    = "subnet_linux"
        "private_ip_address_allocation" = "Dynamic"
      }
    ]
  }
  "nic2" = {
    "name"   = "nic-dev-02"
    "rg_key" = "rg1"

    "ip_configurations" = [
      {
        "name"                          = "ipconfig2"
        "subnet_key"                    = "subnet_window"
        "private_ip_address_allocation" = "Dynamic"
      }
    ]
  }
}
pip_info = {
  "pip1" = {
    "name"              = "pip-dev-01"
    "rg_key"            = "rg1"
    "allocation_method" = "Static"
    "sku"               = "Standard"
  }
}
vm_info = {
  "vm_linux" = {
    "name"    = "vm-linux-01"
    "rg_key"  = "rg1"
    "nic_key" = "nic1"

    "os_type" = "linux"

    "vm_size" = "Standard_D2ls_v7"

    "image_reference" = {
      "publisher" = "Canonical"
      "offer"     = "0001-com-ubuntu-server-jammy"
      "sku"       = "22_04-lts-gen2"
      "version"   = "latest"
    }

    "os_disk" = {
      "name"                 = "vm-linux-01-osdisk"
      "caching"              = "ReadWrite"
      "storage_account_type" = "Standard_LRS"
    }

    "os_profile" = {
      "computer_name"  = "vm-linux-01"
      "admin_username" = "azureuser"
      "admin_password" = "P@ssw0rd1234!"
    }
  }

  "vm_windows" = {
    "name"    = "vm-windows-01"
    "rg_key"  = "rg1"
    "nic_key" = "nic2"

    "os_type" = "windows"

    "vm_size" = "Standard_D2ls_v7"

    "image_reference" = {
      "publisher" = "MicrosoftWindowsServer"
      "offer"     = "WindowsServer"
      "sku"       = "2022-datacenter-azure-edition"
      "version"   = "latest"
    }

    "os_disk" = {
      "name"                 = "vm-windows-01-osdisk"
      "caching"              = "ReadWrite"
      "storage_account_type" = "Standard_LRS"
    }

    "os_profile" = {
      "computer_name"  = "vm-windows-01"
      "admin_username" = "azureuser"
      "admin_password" = "P@ssw0rd1234!"
    }
  }
}
bastion_info = {
  "bastion1" = {
    "name"       = "bstn1"
    "rg_key"     = "rg1"
    "subnet_key" = "subnet_bastion"
    "pip_key"    = "pip1"
    "ip_configuration" = {
      "ip_configuration_name" = "ipcn01"
    }
  }
}
nsg_info = {
  "nsg1" = {
    "name"   = "nsg-web"
    "rg_key" = "rg1"

    "security_rule_info" = [
      {
        "name"                       = "Allow-SSH"
        "priority"                   = 100
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "22"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      },
      {
        "name"                       = "Allow-HTTP"
        "priority"                   = 110
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "80"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      },
      {
        "name"                       = "Allow-HTTPS"
        "priority"                   = 120
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "443"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      },
      {
        "name"                       = "Allow-RDP"
        "priority"                   = 120
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "3389"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
    ]
  }
}
