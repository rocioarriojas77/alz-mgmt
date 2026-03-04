data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_cognitive_account" "openai" {
  name                = var.openai_account_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "OpenAI"
  sku_name = "S0"

  custom_subdomain_name = var.custom_subdomain_name
}

resource "azurerm_cognitive_deployment" "model" {
  name                 = var.deployment_name
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format = "OpenAI"
    name   = var.model_name
  }

  sku {
    name = "Standard"
  }
}

resource "azurerm_role_assignment" "me_openai_user" {
  scope                = azurerm_cognitive_account.openai.id
  role_definition_name = "Cognitive Services OpenAI User"
  principal_id         = data.azurerm_client_config.current.object_id
}
