terraform {
  backend "azurerm" {
    resource_group_name  = "VRIT-RG"
    storage_account_name = "vritsoluonstoacc"
    container_name       = "tfstate"
    key                  = "TF-APP.terraform.tfstate"
  }
}