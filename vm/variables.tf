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

# Variável para o nome de usuário do administrador
variable "admin_username" {
  description = "O nome de usuário do administrador para a VM"
  type        = string
  default     = "wordpress"
}

# Variável para a senha do administrador
variable "admin_password" {
  description = "A senha do administrador para a VM"
  type        = string
  sensitive   = true
  default = "Word@1234"
}