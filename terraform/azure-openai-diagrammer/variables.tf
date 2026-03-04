variable "location" {
  type    = string
  default = "eastus2"
}

variable "resource_group_name" {
  type    = string
  default = "rg-aoai-diagrammer"
}

variable "openai_account_name" {
  type    = string
  default = "aoai-diagrammer-rocio"
}

variable "custom_subdomain_name" {
  type    = string
  default = "aoai-diagrammer-rocio"
}

variable "deployment_name" {
  type    = string
  default = "diagrammer-gpt"
}

variable "model_name" {
  type    = string
  default = "gpt-4o-mini"
}
``
