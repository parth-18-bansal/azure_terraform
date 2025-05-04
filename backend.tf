terraform {
  backend "azurerm" {
    storage_account_name = "terraformdemotfstateblob"
    container_name = "backend"
    key = "terraform.tfstate"
    access_key = ""
  }
}