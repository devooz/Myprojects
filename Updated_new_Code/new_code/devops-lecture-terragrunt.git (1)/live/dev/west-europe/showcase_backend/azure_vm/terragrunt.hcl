# Configuration file for backend App Service

locals {
  # Automatically load environment-level variables from files in parent folders
  location_vars = read_terragrunt_config(find_in_parent_folders("location.hcl"))
  env_vars      = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  global_vars   = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  # Extract out common variables for reuse
  location = local.location_vars.locals.location
  env      = local.env_vars.locals.env
  suffix   = local.env_vars.locals.suffix
  project  = local.global_vars.locals.project
  vmName   = "terragrun665"
}

# Specify the path to the source of the module
terraform {
  source = "../../../../../modules/azurerm_vm"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# To create an App Service we need a resource group in which it will be created
dependency "resource_group" {
  config_path = "../../resource_group"
  mock_outputs = {
    resource_name = "mockOutput"
  }
}


# Input variables specific for the App Service module
inputs = {

  location            = local.location
  name = dependency.resource_group.outputs.resource_name
  vmname              = local.vmName
  
  
}
