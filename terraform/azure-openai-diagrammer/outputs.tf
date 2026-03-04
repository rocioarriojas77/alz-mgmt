output "openai_endpoint" {
  value = azurerm_cognitive_account.openai.endpoint
}

output "deployment_name" {
  value = azurerm_cognitive_deployment.model.name
}
