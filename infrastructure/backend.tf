terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "ttfstatefile"  # your real account name
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
