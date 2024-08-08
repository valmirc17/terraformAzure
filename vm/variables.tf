variable "location" {
    description = "Região aonde os recursos serão criados"
    type = string
    default = "brazilsouth"
  
}

variable "resource_group_name" {
    description = "Nome do grupo de recursos"
    type = string
    default = "rg-terraform"
  
}

variable "network_interface_id" {
  description = "ID da interface de rede"
  type        = string
}